import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreen();
}

class _ScannerScreen extends State<ScannerScreen> {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  @override
  void initState() {
    super.initState();
    _setupCamera();
  }

  // @override
  // void dispose() {
  //   cameraController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    if (cameraController == null ||
        cameraController?.value.isInitialized == false) {
      return Center(child: CircularProgressIndicator());
    }
    return SafeArea(
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [CameraPreview(cameraController!)],
        ),
      ),
    );
  }

  Future<void> _setupCamera() async {
    List<CameraDescription> _cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      setState(() {
        cameras = _cameras;
        cameraController = CameraController(
          _cameras.first,
          ResolutionPreset.high,
        );
      });
      cameraController?.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }
}
