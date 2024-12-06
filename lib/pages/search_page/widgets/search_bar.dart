import 'package:final_project/core/localization/locale_manager.dart';
import 'package:final_project/core/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBarPage extends StatefulWidget {
  @override
  _SearchBarPageState createState() => _SearchBarPageState();
  final LocalizationManager localManager;
  final ThemeManager themeManager;

  const SearchBarPage(
      {super.key, required this.themeManager, required this.localManager});
}

class _SearchBarPageState extends State<SearchBarPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _musicList = [
    "Shape of You",
    "Blinding Lights",
    "Someone Like You",
    "Bohemian Rhapsody",
    "Yesterday",
    "Hotel California",
    "Rolling in the Deep",
    "Sweet Child O' Mine",
    "Smells Like Teen Spirit",
    "Wonderwall"
  ];
  List<String> _filteredMusicList = [];

  @override
  void initState() {
    super.initState();
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredMusicList = _musicList
          .where((music) => music.toLowerCase().contains(query))
          .toList();
    });
    _searchController.addListener((){
      _filterMusicList(_searchController.text);
    });
  }

  void _filterMusicList(String query){
    setState(() {
      _filteredMusicList = _musicList
          .where((music)=>
                  music.toLowerCase().contains(query)
      )
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localManager = Provider.of<LocalizationManager>(context);
    final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:TextField(
          controller: _searchController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: localManager.translate("search"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text(
                localManager.translate("cancel"),
                style: TextStyle(
                  color: Colors.grey[200]
                ),
              )
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                localManager.translate("recent_searches"),
                style: TextStyle(color:
                themeManager.themeMode == ThemeMode.dark ? Colors.white : Colors.black),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredMusicList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.music_note,
                          color: themeManager.themeMode == ThemeMode.dark ? Colors.grey[600] : Colors.black12,
                          size: 50,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _filteredMusicList[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
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
