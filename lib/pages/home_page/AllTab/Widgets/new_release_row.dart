import 'dart:math';

import 'package:flutter/material.dart';


class NewReleaseRow extends StatelessWidget
{
  final Map<String,String> newReleases = {
    "Bear" : "Letting Go",
    "Singer" : "Song 1",
    "Singer1":"Song 2",
    "Singer2":"Song 3",
    "Singer3":"Song 4",
  };

  @override
  Widget build(BuildContext context) {
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
                  const Icon(
                    Icons.album_rounded,
                    size: 100,
                    color: Colors.grey,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "New Releases from",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey
                        ),
                      ),
                      Text(
                        randomKey,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
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