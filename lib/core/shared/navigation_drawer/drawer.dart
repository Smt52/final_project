import 'package:final_project/core/localization/locale_manager.dart';
import 'package:final_project/core/shared/navigation_drawer/drawer_item.dart';
import 'package:final_project/pages/profile_pages/add_user.dart';
import 'package:final_project/pages/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget{
  const DrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final localManager = Provider.of<LocalizationManager>(context);
    return
      Drawer(
      child:Material(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(context),
              const Divider(thickness: 1,height: 10,color: Colors.grey,),
              DrawerItem(
                name: localManager.translate("add_user"),
                icon: Icons.add_circle_outline,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddUserPage()),
                ),
              ),
              const SizedBox(height: 20,),
              DrawerItem(
                  name: localManager.translate("settings"),
                  icon: Icons.settings_outlined,
                  onPressed:  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  )
              )
            ],
          ),
        ),
      )
    );
  }

  Widget headerWidget(BuildContext context){
    final localManager = Provider.of<LocalizationManager>(context);
    return Row(
      children: [
        const Icon(
          Icons.person,
          size: 60,
          color: Colors.grey,
        ),
         const SizedBox(width: 10,),
        Column(
          children: [
            Row(
              children: [
                Text(
                  localManager.translate("user_name"),
                  style:const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  localManager.translate("view_profile"),
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}