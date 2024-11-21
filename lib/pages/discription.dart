import 'package:flutter/material.dart';

//import '../models/note_data_base.dart';
//import 'package:flutter_notes/models/note_data_base.dart';

class DiscriptionPage extends StatelessWidget {
  final String text1;
  const DiscriptionPage({super.key,required this.text1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        color:Theme.of(context).colorScheme.background,
        height:double.infinity,
        width: double.infinity,
        child: Text(text1,style: const TextStyle(fontSize: 20),))
    );
  }
}