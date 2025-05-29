import 'package:healthy_nutrition/screens/external_screen/scanning_camera.dart';
import 'package:flutter/material.dart';


class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreen();
}

class _ScannerScreen extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 80, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ScaningSreen()));
            }, child: Text("Scan!"))
          ],
        ),
      ),
    );
  }
}
