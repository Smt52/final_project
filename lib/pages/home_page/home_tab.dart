import 'package:final_project/core/localization/locale_manager.dart';
import 'package:final_project/core/shared/navigation_drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../profile_pages/profile_picture.dart';
import 'AllTab/alltab.dart';
import 'MusicTab/music_tab.dart';
import 'PodcastTab/podcast_tab.dart';

class HomeTab extends StatefulWidget{
  const HomeTab({super.key});

  @override
  _HomeTabState createState()=> _HomeTabState();
}

class _HomeTabState extends State<HomeTab>{

  int _selectedTabIndex = 0;
  final List<Widget> _homeTabTabs=[
    const AllTab(isMusicTab: false,),
    MusicTab(),
    PodcastTab(),
  ];
  @override
  Widget build(BuildContext context) {
    final localManager = Provider.of<LocalizationManager>(context);
    final List<String> _tabTitles = [localManager.translate("all"),localManager.translate("musics"),localManager.translate("podcasts")];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ProfilePicture(),
              const SizedBox(width: 10),
              Row(
                children: List.generate(_tabTitles.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTabIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: _selectedTabIndex == index
                            ? Colors.green.shade900
                            : Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Text(
                        _tabTitles[index],
                        style: TextStyle(
                          color: _selectedTabIndex == index
                              ? Colors.black
                              : Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
        drawer: const DrawerWidget(),
        body: _homeTabTabs[_selectedTabIndex],
      ),
    );
  }
}

