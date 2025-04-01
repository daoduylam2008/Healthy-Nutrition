import 'package:flutter/material.dart';


// ignore: must_be_immutable, camel_case_types
class bottomNavigationBar extends StatefulWidget {
  List<Widget> items;
  bottomNavigationBar(this.items, {super.key});
  @override
  State<StatefulWidget> createState() => _bottomNavigationBar();
}


// ignore: camel_case_types
class _bottomNavigationBar extends State<bottomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}
