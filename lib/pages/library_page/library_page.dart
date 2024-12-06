import 'package:final_project/core/localization/locale_manager.dart';
import 'package:final_project/core/shared/navigation_drawer/drawer.dart';
import 'package:final_project/core/theme/theme_manager.dart';
import 'package:final_project/pages/library_page/model/library_item.dart';
import 'package:final_project/pages/library_page/widgets/library_widget.dart';
import 'package:flutter/material.dart';

import '../profile_pages/profile_picture.dart';


class LibraryPage extends StatelessWidget{
  final LocalizationManager localManager;
  final ThemeManager themeManager;
  const LibraryPage(
  {super.key,required this.localManager,required this.themeManager});
  @override
  Widget build(BuildContext context) {
    final List<LibraryItem> _musicLibrary = [
      LibraryItem(
        title: "Rock",
        description: "Rock Music Library",
        icon: Icons.my_library_music_rounded,
      ),
      LibraryItem(
        title: "Pop",
        description: "Pop Music Library",
        icon: Icons.music_note,
      ),
      LibraryItem(
        title: "Jazz",
        description: "Jazz Music Library",
        icon: Icons.music_video,
      ),
      LibraryItem(
        title: "Classical",
        description: "Classical Music Library",
        icon: Icons.headset,
      ),
      LibraryItem(
        title: "Hip-Hop",
        description: "Hip-Hop Music Library",
        icon: Icons.queue_music,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(children: [
          const ProfilePicture(),
          const SizedBox(width: 10),
          Text(localManager.translate("library")),
          Row(
            mainAxisAlignment : MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  print("Search button clicked");
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  print("Add button clicked");
                },
              ),
            ],
          ),
        ]),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: _musicLibrary.length,
            itemBuilder: (context,index){
            final item = _musicLibrary[index];
            return LibraryWidget(title: item.title, description: item.description, icon: item.icon);
            }
        ),
      ),
      drawer: DrawerWidget(),
    );

  }
}