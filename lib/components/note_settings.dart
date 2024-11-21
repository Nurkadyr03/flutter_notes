import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  final Function()? onEditTap;
  final Function()?  onDeleteTap;
  const NoteSettings({super.key,
  required this.onEditTap,
  required this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      const SizedBox(height: 10,),
        GestureDetector(
          onTap: onEditTap,
          child: Container(
            height: 40,
            color:Theme.of(context).colorScheme.background,
            child: const Text('update'),
          ),
          

        ),
         GestureDetector(
          onTap:onDeleteTap ,
          child: Container(
            height: 50,
            color:Theme.of(context).colorScheme.background,
            child:const Text('delete'),
          ),
          

        ),
      ],
    );
  }
}