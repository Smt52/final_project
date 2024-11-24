import 'package:flutter/material.dart';
import '../profile_pages/profile_picture.dart';

class HomeTab extends StatefulWidget{
  @override
  _HomeTabState createState()=> _HomeTabState();
}

class _HomeTabState extends State<HomeTab>{

  int _selectedTabIndex = 0;
  final List<Widget> _homeTabtabs=[
    AllTab(),
    // MusicTab(),
    // PodcastTab(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfilePicture(),
            SizedBox(width: 16),
          ],
        ),
        actions: [
          Expanded(
            child: TabBar(
              onTap: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              tabs: const [
                Tab(text: "All"),
                Tab(text: "Music"),
                Tab(text: "Podcast"),
              ],
            ),
          ),
        ],
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        children: _homeTabtabs,
      ),
    );
  }
}

}