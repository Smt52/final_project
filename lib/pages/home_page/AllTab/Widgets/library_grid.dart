import 'package:flutter/material.dart';


class LibraryGrid extends StatelessWidget {
  final List<String> libraries = [
    "Library 1",
    "Library 2",
    "Library 3",
    "Library 4",
    "Library 5",
    "Library 6",
    "Library 7",
    "Library 8",
    "Library 9",
    "Library 10",
    "Library 11",
    "Library 12",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2/0.7,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
      ),
      itemCount: libraries.length > 8 ? 8 : libraries.length,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade700,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child:InkWell(
              onTap: (){
                print("Card ${libraries[index]} pressed");
              },
              borderRadius: BorderRadius.circular(8),
              splashColor: Colors.white.withOpacity(0.2),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                color: Colors.grey.shade700,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.music_note,
                        size: 25,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        libraries[index],
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}