import 'dart:math';

import 'package:final_project/core/localization/locale_manager.dart';
import 'package:final_project/core/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NewReleaseRow extends StatelessWidget
{
  final String title;
  final bool isSearch;
  final Map<String,String> newReleases = {
    "Bear" : "Letting Go",
    "Singer" : "Song 1",
    "Singer1":"Song 2",
    "Singer2":"Song 3",
    "Singer3":"Song 4",
  };

  NewReleaseRow({super.key,required this.title,required this.isSearch});

  @override
  Widget build(BuildContext context) {
    final localManager= Provider.of<LocalizationManager>(context);
    final themeManager = Provider.of<ThemeManager>(context);
    List<String> keys = newReleases.keys.toList();
    Random random = Random();
    String randomKey = keys[random.nextInt(keys.length)];

    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  !isSearch ?
                  Icon(
                    Icons.album_rounded,
                    size: 100,
                    color: themeManager.themeMode == ThemeMode.dark ? Colors.grey : Colors.black,
                  ):const SizedBox.shrink(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: isSearch ? const EdgeInsets.only(left: 16):EdgeInsets.zero,
                        child: Text(
                          localManager.translate(title),
                          style: TextStyle(
                              fontSize: isSearch ? 18 : 14,
                              fontWeight: isSearch ? FontWeight.bold:FontWeight.normal,
                              color: themeManager.themeMode == ThemeMode.dark ? Colors.grey : Colors.black87,
                          ),
                        ),
                      ),
                      !isSearch?
                      Text(
                        randomKey,
                        style:  TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: themeManager.themeMode == ThemeMode.dark ? Colors.white : Colors.black,
                        ),
                      ):const SizedBox.shrink(),
                    ],
                  ),
                ],
              )
            ],
          ),
        Container(
          margin: const EdgeInsets.all(10),
          width: double.maxFinite,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.black45)],
          ),
          child:Row(
            children: [
             const  Padding(
                padding: EdgeInsets.fromLTRB(20,10,20,20),
                child: Icon(
                  Icons.album_outlined,
                  color: Colors.orange,
                  size: 100,
                ),
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 1,
                width: 2,
              ),
              Expanded(
                child:Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newReleases[randomKey]!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Single - $randomKey",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )

                    ),
                    Positioned(
                      bottom: 14,
                      left: 10,
                      child: Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.grey.shade400,
                        size: 20,
                      ),
                    ),
                    const Positioned(
                      bottom: 10,
                      right: 10,
                      child: Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ),
      ],
    );
  }
}