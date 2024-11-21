import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 import 'package:flutter_notes/thems/theme_provider.dart';
 import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget  {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 25,
        ),
        margin: const EdgeInsets.only(
          left: 25,
          right: 25,
          top: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //darkMode
            Text(
              "Dark Mode",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            //switch toggle
            CupertinoSwitch(
              
                value: Provider.of<ThemeProvider>(context, listen: false)
                    .isDarkMode,
                onChanged: ( value) =>
                 
                    Provider.of<ThemeProvider>(context, listen: false)
                .toggleTheme()
                
                ),
          ],
        ), 
      ),
    );
  }
}
// MergeSemantics(
//   child: ListTile(
//     title: const Text('Lights'),
//     trailing: CupertinoSwitch(
//       value: _lights,
//       onChanged: (bool value) { setState(() { _lights = value; }); },
//     ),
//     onTap: () { setState(() { _lights = !_lights; }); },
//   ),
// )