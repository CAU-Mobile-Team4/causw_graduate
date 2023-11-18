import 'package:flutter/material.dart';

class MajorClass extends StatefulWidget {
  const MajorClass({super.key});

  @override
  State<MajorClass> createState() => _MajorClassState();
}

class _MajorClassState extends State<MajorClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Major Class'),),
    );
  }
}
