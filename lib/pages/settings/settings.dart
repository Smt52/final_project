import 'package:final_project/core/shared/switch/switch.dart';
import 'package:final_project/core/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/localization/locale_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final localManager = Provider.of<LocalizationManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localManager.translate("settings"),
        ),
      ),
      body: Center(
        child:
        SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(localManager.translate("theme"),
                          style: TextStyle(
                            color: themeManager.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal
                          ),),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: [
                          // Icon(
                          //   Icons.light_mode_sharp,
                          //   color: themeManager.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                          // ),
                          const SizedBox(width: 5,),
                          CustomSwitch(
                              value: themeManager.themeMode == ThemeMode.dark,
                              onChanged: (value) {
                              themeManager.toggleTheme();
                              },
                              activeIcon: const Icon(
                                Icons.dark_mode_sharp,
                                color: Colors.white,
                                size: 20,
                              ),
                              deActiveIcon: const Icon(
                                Icons.light_mode_sharp,
                                color: Colors.orange,
                                size: 20,
                              ),
                              activeColor: Colors.black,
                              deActiveColor: Colors.yellow.shade500
                          ),
                          // Switch(
                          //   activeColor: Colors.white,
                          //   activeTrackColor: Colors.grey,
                          //   inactiveThumbColor: Colors.black,
                          //   inactiveTrackColor: Colors.white,
                          //   activeThumbImage: Icon(Icons.light_mode_sharp),
                          //   value: themeManager.themeMode == ThemeMode.dark,
                          //   onChanged: (value) {
                          //     themeManager.toggleTheme();
                          //   },
                          // ),
                          const SizedBox(width: 5,),
                          // Icon(
                          //   Icons.dark_mode_sharp,
                          //   color: themeManager.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                          // )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(localManager.translate("language"),
                            style: TextStyle(
                                color: themeManager.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal
                            ),),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          DropdownButton<Locale>(
                            borderRadius: BorderRadius.circular(3),
                            style: TextStyle(
                              color:themeManager.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                              fontSize: 16,
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down_circle_outlined,
                              color: themeManager.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                            ),
                            underline: Container(),
                            dropdownColor: themeManager.themeMode == ThemeMode.dark ? Colors.black : Colors.white,
                            focusColor: themeManager.themeMode == ThemeMode.dark ? Colors.black : Colors.white,
                            value: localManager.currentLocale,
                            onChanged: (Locale? newLocale) {
                              if (newLocale != null) {
                                localManager.changeLocale(newLocale);
                              }
                            },
                            items: [
                              DropdownMenuItem(
                                  value: Locale('en'),
                                  child: Text(localManager.translate("english"))),
                              DropdownMenuItem(
                                  value: Locale('tr'),
                                  child: Text(localManager.translate("turkish"))),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
      ),
    );
  }
}

