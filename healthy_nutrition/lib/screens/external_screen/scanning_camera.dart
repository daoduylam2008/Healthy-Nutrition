import 'dart:ui';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/extension.dart';
import 'package:healthy_nutrition/main.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:camera/camera.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:healthy_nutrition/request.dart';
import 'package:healthy_nutrition/utils.dart';
import 'package:healthy_nutrition/widgets/foodBox.dart';

// ignore: must_be_immutable
class ScaningSreen extends StatefulWidget {
  UserInfo info;
  ScaningSreen({super.key, required this.info});

  @override
  State<ScaningSreen> createState() => _ScaningSreen();
}

class _ScaningSreen extends State<ScaningSreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  // ignore: prefer_typing_uninitialized_variables
  var size, width, height;

  late ImageLabeler imageLabeler;

  bool _canProcess = false;
  bool _isBusy = false;
  bool scan = false;

  final Map<String, dynamic> results = {};

  CameraController? controller;

  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final camera = cameras.first;
    controller = CameraController(camera, ResolutionPreset.high);
    init();
  }

  @override
  void dispose() {
    controller!.dispose();
    _canProcess = false;
    imageLabeler.close();
    super.dispose();
  }

  init() async {
    final String path = "models/model_v1.tflite";
    final modelPath = await getAssetPath(path);
    final options = LocalLabelerOptions(
      modelPath: modelPath,
      confidenceThreshold: 0,
    );
    imageLabeler = ImageLabeler(options: options);

    _canProcess = true;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox.expand(
          child: FutureBuilder(
            future: controller!.initialize(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(
                  controller!,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 45, right: 20, left: 20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: boxColor,
                              radius: 30,
                              child: BackButton(color: white),
                            ),
                          ],
                        ),
                      ),
                      BlurryContainer(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        blur: 10,
                        elevation: 0,
                        width: double.infinity,
                        height: 130,
                        color: const Color.fromARGB(128, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [captureButton(controller!)],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Widget captureButton(CameraController controller) {
    return InkResponse(
      onTap: () async {
        final can = await Haptics.canVibrate();
        controller.startImageStream((image) {
          process(image);
        });

        if (!can) return;
        await Haptics.vibrate(HapticsType.success);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(radius: 43, backgroundColor: white),
          CircleAvatar(radius: 40, backgroundColor: Colors.black),
          CircleAvatar(radius: 36, backgroundColor: white),
        ],
      ),
    );
  }

  void process(CameraImage image) async {
    final inputImage = _imageInputFromCamera(image);
    if (inputImage == null) return;
    _scanProcess(inputImage);
  }

  Future<void> _scanProcess(InputImage inputImage) async {
    setState(() {
      scan = false;
    });
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;

    setState(() {
      results.clear();
    });

    final _results = {};
    final labels = await imageLabeler.processImage(inputImage);
    List names = [];
    for (final label in labels) {
      List l = label.label.split(" ");
      l.removeAt(0);
      String name = l.join(" ");

      double confidence = (label.confidence * 100).roundNum(1);
      if (confidence > 0) {
        _results[name] = confidence;
        names.add(name);
      }
    }
    setState(() {
      for (final name in names) {
        results[name] = _results[name];
      }
      scan = true;
    });
    _isBusy = false;
    controller!.stopImageStream();

    showModalBottomSheet(
      context: context,
      isDismissible: true,
      showDragHandle: false,
      backgroundColor: backgroundColor,
      isScrollControlled: false,
      builder: (context) {
        return SafeArea(
          minimum: EdgeInsets.only(top: 20, right: 20, left: 20),
          child: FutureBuilder(
            future: fetchNames(names),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Widget> view = [];
                for (final food in snapshot.data!) {
                  view.add(
                    foodBox(null, results[food.name], food, null, widget.info, context),
                  );
                }
                return SizedBox(
                  height: height * 0.5,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: view,
                    ),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }

  InputImage? _imageInputFromCamera(CameraImage image) {
    if (controller == null) return null;
    final camera = cameras.first;
    final sensorOrientation = camera.sensorOrientation;

    InputImageRotation? rotation;
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation =
          _orientations[controller!.value.deviceOrientation];
      if (rotationCompensation == null) return null;
      if (camera.lensDirection == CameraLensDirection.front) {
        // front-facing
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        // back-facing
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
    }

    if (rotation == null) return null;

    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) {
      // validate format depending on platform
      return null;
    }

    // since format is constraint to nv21 or bgra8888, both only have one plane
    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    // compose InputImage using bytes
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation, // used only in Android
        format: format, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),
    );
  }
}
