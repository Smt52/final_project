import 'package:final_project/core/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/localization/locale_manager.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final localManager = Provider.of<LocalizationManager>(context);

    return Center(
      child:
      SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center, // Ensure children are centered horizontally
        children: [
          // Theme Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0), // Add some padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(localManager.translate("theme"),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal
                        ),),
                      ],
                    ),
                    Row(
                      children: [
                        Material(
                          child:
                        Switch(
                          value: themeManager.themeMode == ThemeMode.dark,
                          onChanged: (value) {
                            themeManager.toggleTheme();
                          },
                        ),
                      )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Language Section
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
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal
                          ),),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Material(
                          child:
                        DropdownButton<Locale>(
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
    );
  }
}

