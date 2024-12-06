import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/theme_manager.dart';

class DrawerItem extends StatelessWidget{
  const DrawerItem ({Key? key,required this.name,required this.icon,required this.onPressed}) : super (key:key);

  final String name;
  final IconData icon;
  final Function() onPressed;
  
  
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
                color: themeManager.themeMode == ThemeMode.dark ?
                Colors.grey : Colors.black,
            ),
            const SizedBox(width: 40,),
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                color:themeManager.themeMode == ThemeMode.dark ?
                Colors.grey : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
  
}