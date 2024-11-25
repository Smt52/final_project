import 'package:flutter/material.dart';
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
    const AllTab(),
    MusicTab(),
    PodcastTab(),
  ];
final List<String> _tabTitles = ["All","Music","Podcast"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
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
        body: _homeTabTabs[_selectedTabIndex],
      ),
    );
  }
}

