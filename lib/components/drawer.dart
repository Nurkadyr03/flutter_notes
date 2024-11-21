import 'package:flutter/material.dart';
import 'package:flutter_notes/components/drawer_tile.dart';
import 'package:flutter_notes/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Column(
        children: [
          //header
          DrawerHeader(
            
        padding: EdgeInsets.zero,
        margin:const EdgeInsets.only(top: 30,right: 30,left: 30),
        child: Container(
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            image: DecorationImage(
              image: AssetImage('assets/images/photo_2023.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
          //notes tile
          DrawerTile(
            leading:const Icon(Icons.person),
            title: "Asanbek uulu Nurkadyr",
            onTap: () {},
          ),
          //settings tile
          DrawerTile(
            leading:const Icon(Icons.settings),
            title: "Settings",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SettingsPage()));
            },
          )
        ],
      ),
    );
  }
}
