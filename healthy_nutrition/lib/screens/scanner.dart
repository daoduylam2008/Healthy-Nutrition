import 'package:flutter/material.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:healthy_nutrition/machine_learning.dart';

// import 'package:camerawesome/pigeon.dart';

// 192.168.6.193

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreen();
}

class _ScannerScreen extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadModel(),
        builder: (context, snapshot) {
          return CameraAwesomeBuilder.awesome(
            enablePhysicalButton: true,
            topActionsBuilder: (state) {
              return Container();
            },
            saveConfig: SaveConfig.photo(),
          );
        }
      ),
    );
  }
}
