import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/main.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:camera/camera.dart';
import 'package:blurrycontainer/blurrycontainer.dart';


class ScaningSreen extends StatefulWidget {
  ScaningSreen({super.key});

  @override
  State<ScaningSreen> createState() => _ScaningSreen();
}

class _ScaningSreen extends State<ScaningSreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  var size, width, height;

  CameraController? controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final camera = cameras.first;
    controller = CameraController(camera, ResolutionPreset.high);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
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
                return CameraPreview(controller!,
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40, right: 20, left: 20),
                      child: Row(
                      children: [
                  CircleAvatar(
                    backgroundColor: boxColor,
                    radius: 30,
                    child: BackButton(
                      color: white,
                        ),
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
                      children: [
                        captureButton()
                      ],
                    ),
                    )
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

  Widget captureButton() {
    return InkResponse(
      onTap: () async {
        final can = await Haptics.canVibrate();

        if (!can) return;
        await Haptics.vibrate(HapticsType.success);

      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 43,
            backgroundColor: white,
          ),
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.black,
          ),
          CircleAvatar(
            radius: 36,
            backgroundColor: white,
          )
        ],
      ),
    );
  }
}
