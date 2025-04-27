import 'package:flutter/material.dart';
import 'package:healthy_nutrition/models.dart';

class InfoPage extends StatefulWidget {
  UserInfo info;
  InfoPage({super.key, required this.info});

  @override
  State<InfoPage> createState() => _InfoPage();
}

class _InfoPage extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 60, right: 20, left: 20),
        child: Column(
          children: [
            Align(alignment: Alignment.centerLeft, child: BackButton()),
            Container(
              decoration: BoxDecoration(),
            )
          ],
        ),
      ),
    );
  }
}
