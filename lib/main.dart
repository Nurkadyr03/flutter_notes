import 'package:flutter/material.dart';
import 'package:flutter_notes/app.dart';
import 'package:flutter_notes/models/note_data_base.dart';
import 'package:flutter_notes/thems/theme_provider.dart';

import 'package:provider/provider.dart';

void main() async {
  //initialize note isar db
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDataBase.initialize();
  runApp(
    MultiProvider(
      providers: [
        //Note Provider
        ChangeNotifierProvider(create: (context) => NoteDataBase()),
        //Theme Provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
