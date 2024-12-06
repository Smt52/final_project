import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/theme_manager.dart';

class HorizontalScrollGrid extends StatelessWidget {
  final List<String> cardTitles;
  final String title;
  final IconData icon;

  HorizontalScrollGrid({required this.cardTitles, required this.title,required this.icon,});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8,0, 0, 0),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: themeManager.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardTitles.length,
                itemBuilder: (context,index){
                  return Container(
                    margin: const EdgeInsets.all(8),
                    width: 120,
                    height: 140,
                    decoration: BoxDecoration(
                      color: themeManager.themeMode == ThemeMode.dark ? Colors.grey.shade800 : Colors.grey.shade800,
                    ),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            icon,
                            color: themeManager.themeMode == ThemeMode.dark ? Colors.white.withOpacity(0.2) : Colors.black,
                            size: 100,
                          ),
                          Text(
                            cardTitles[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: themeManager.themeMode == ThemeMode.dark ? Colors.white.withOpacity(0.8) : Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
