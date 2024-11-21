
import 'package:flutter/material.dart';
import 'package:flutter_notes/pages/notes_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Salam Nurkadyr ',
                style: GoogleFonts.dmSerifText(
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
            ]
          ),
         const SizedBox(height: 200,),
          InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NotesPage())),
              child: const Text(
                "PUSH",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ))
            ],
          ),
         
        
      
    );
  }
}
