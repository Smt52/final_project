import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/theme_manager.dart';


class ProfilePicture extends StatelessWidget{
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return       GestureDetector(
      onTap: (){
        Scaffold.of(context).openDrawer();
      },
      child:  ClipOval(
        child: Container(
          color: themeManager.themeMode == ThemeMode.dark ? Colors.grey[300] : Colors.black54,
          child:  Icon(
            size: 30,
            Icons.person,
            color: themeManager.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}