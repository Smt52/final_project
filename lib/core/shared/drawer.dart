import 'package:final_project/core/localization/locale_manager.dart';
import 'package:final_project/pages/profile_pages/add_user.dart';
import 'package:final_project/pages/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final localManager = Provider.of<LocalizationManager>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                localManager.translate('navigation'),
                style: const TextStyle(color: Colors.white,fontSize: 20),
              ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: Text(localManager.translate("add_user")),
            onTap: (){
              Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>AddUserPage())
              );
            },
          ),
          ListTile(
            leading:const Icon(Icons.settings),
            title: Text(localManager.translate("settings")),
            onTap: (){
              Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=>SettingsScreen())
              );
            },
          ),
        ],
      ),
    );
  }
}