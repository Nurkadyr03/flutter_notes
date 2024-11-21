import 'package:flutter/material.dart';
//light mode
ThemeData lightMode=ThemeData(brightness: Brightness.light,
colorScheme: ColorScheme.light(
  background:const Color.fromARGB(255, 211, 206, 206),
  primary: Colors.grey.shade200,
  secondary: Colors.grey.shade400,
  inversePrimary: const Color.fromARGB(255, 17, 17, 17),
)
);
//dark mode
ThemeData darkMode=ThemeData(
  brightness: Brightness.dark,
colorScheme: ColorScheme.dark(
  background: Colors.grey.shade900,
  primary:const Color.fromARGB(255, 20, 20, 20),
  secondary: const Color.fromARGB(255, 38, 38, 38),
  inversePrimary: Colors.grey.shade300,
)
);
