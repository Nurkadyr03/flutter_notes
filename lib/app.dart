
import 'package:flutter/material.dart';
import 'package:flutter_notes/pages/home_page.dart';

import 'package:flutter_notes/thems/theme_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const HomePage(),
     theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}