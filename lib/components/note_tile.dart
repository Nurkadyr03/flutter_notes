import 'package:flutter/material.dart';
import 'package:flutter_notes/components/note_settings.dart';
import 'package:flutter_notes/pages/discription.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? onEditPressed; // update
  final void Function()? onDeletePressed; //delete
  const NoteTile({
    super.key,
    required this.text,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DiscriptionPage(
            text1:text
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: const EdgeInsets.only(bottom: 60, left: 25, right: 25),
        child: ListTile(
          title: Text(text),
          trailing: Builder(builder: (context) {
            return IconButton(
              onPressed: () => showPopover(
                width: 60,
                height: 100,
                backgroundColor: Theme.of(context).colorScheme.background,
                context: context,
                bodyBuilder: (context) => NoteSettings(
                  onEditTap: onEditPressed,
                  onDeleteTap: onDeletePressed,
                ),
              ),
              icon: const Icon(Icons.more_vert),
            );
          }),
        ),
      ),
    );
  }
}
