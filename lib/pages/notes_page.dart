import 'package:flutter/material.dart';

import 'package:flutter_notes/components/drawer.dart';
import 'package:flutter_notes/components/note_tile.dart';
import 'package:flutter_notes/models/note.dart';
import 'package:flutter_notes/models/note_data_base.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // text controller to access what the user typed
  final textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    //on up startup,frtch exting
    
    readNotes();
  }

  //create a note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        backgroundColor: Theme.of(context).colorScheme.background,
        content: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none
          ),
          cursorColor: Colors.red,
          maxLines: 12,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          controller: textController,
        ),
        actions: [
          //create button
          MaterialButton(
            onPressed: () {
              //add to db
              context.read<NoteDataBase>().addNote(textController.text);
              //clear controller
              textController.clear();
              //pop dialog box
              Navigator.pop(context);
            },
            child: const Text("create"),
          )
        ],
      ),
    );
  }

  //read a note
  void readNotes() {
    context.read<NoteDataBase>().fetchNotes();
  }

  //update a note
  void updateNote(Note note) {
    //pre-fill the current note text
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        
        backgroundColor: Theme.of(context).colorScheme.background,
        content: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none
          ),
          maxLines: 12,
          minLines: 3,
          cursorWidth: 1,
          cursorColor: Colors.red,
          keyboardType: TextInputType.multiline,
          controller: textController,
        ),
        actions: [
          //update button
          MaterialButton(
            onPressed: () {
              //update note in db
              context
                  .read<NoteDataBase>()
                  .updateNote(note.id, textController.text);
              //clear controller
              textController.clear();
              //pop dialog box
              Navigator.pop(context);
            },
            child: const Text("update"),
          )
        ],
      ),
    );
  }

  //delete a note
  void deleteNote(int id) {
    context.read<NoteDataBase>().delete(id);
  }

  @override
  Widget build(BuildContext context) {
    //note db
    final noteDataBase = context.watch<NoteDataBase>();
    //current notes
    List<Note> currentNotes = noteDataBase.currentNotes;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 246, 234, 234),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //HEADING
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "Nurkadyr",
              style: GoogleFonts.dmSerifText(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //LIST OF NOTES
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1),
              scrollDirection: Axis.vertical,
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                //get individual note
                final note = currentNotes[index];

                //list tile UI
                return NoteTile(
                  text: note.text,
                  onEditPressed: () => updateNote(note),
                  onDeletePressed: () => deleteNote(
                    note.id,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add,
            color: Theme.of(context).colorScheme.inversePrimary),
      ),
    );
  }
}
