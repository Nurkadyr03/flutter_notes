import 'package:flutter/material.dart';
import 'package:flutter_notes/models/note.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class NoteDataBase extends ChangeNotifier {
 static late Isar isar;
//Initiallize -Data Base
  static Future<void> initialize() async {
   final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

//list of notes
  final List<Note> currentNotes = [];

//Create - a note and save to db
  Future<void> addNote(String textFromUser) async {
    //create a new note object
    final newNote = Note()..text = textFromUser;
    //save to database
    await isar.writeTxn(() => isar.notes.put(newNote));
// re-read from db
    fetchNotes();
  }

//Read  -  notes from db
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

//Update  -  a note in db
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

//Delete   -  a note from the db
  Future<void> delete(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
