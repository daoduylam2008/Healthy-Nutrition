import 'package:flutter/material.dart';
import 'package:healthy_nutrition/constants.dart';
import 'package:healthy_nutrition/models.dart';
import 'package:camera/camera.dart';

class ScaningSreen extends StatefulWidget {
  ScaningSreen({super.key});

  @override
  State<ScaningSreen> createState() => _ScaningSreen();
}

class _ScaningSreen extends State<ScaningSreen>  with WidgetsBindingObserver, TickerProviderStateMixin {
  var size, width, height;
  late List<CameraDescription> cameras;
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
        child: FutureBuilder(
          future: controller.initialize(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(controller);
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
