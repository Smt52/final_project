import 'package:final_project/core/localization/locale_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LibraryGrid extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
      final localManager = Provider.of<LocalizationManager>(context);
      final List<String> libraries = [
          "${localManager.translate("library")} 1",
        "${localManager.translate("library")}  2",
        "${localManager.translate("library")}  3",
        "${localManager.translate("library")}  4",
        "${localManager.translate("library")}  5",
        "${localManager.translate("library")}  6",
        "${localManager.translate("library")}  7",
        "${localManager.translate("library")}  8",
        "${localManager.translate("library")}  9",
        "${localManager.translate("library")}  10",
        "${localManager.translate("library")}  11",
        "${localManager.translate("library")}  12",
      ];
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