import 'package:flutter/material.dart';

class BSMclassSelection extends StatefulWidget {
  const BSMclassSelection({super.key});

  @override
  State<BSMclassSelection> createState() => _BSMclassSelectionState();
}

class _BSMclassSelectionState extends State<BSMclassSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select BSM Class'),),
    );
  }
}
