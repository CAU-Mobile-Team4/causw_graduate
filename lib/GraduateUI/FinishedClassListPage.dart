import 'package:flutter/material.dart';

class FinishedClassList extends StatefulWidget {
  const FinishedClassList({super.key});

  @override
  State<FinishedClassList> createState() => _FinishedClassListState();
}

class _FinishedClassListState extends State<FinishedClassList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Finished Class List'),),
    );
  }
}
