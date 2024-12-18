import 'package:final_project/core/localization/locale_manager.dart';
import 'package:final_project/pages/home_page/AllTab/Widgets/new_release_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Widgets/horizontal_grid.dart';
import 'Widgets/library_grid.dart';

class AllTab extends StatefulWidget {
  final bool isMusicTab;
  const AllTab({super.key,required this.isMusicTab});

  @override
  _AllTabState createState() => _AllTabState();
}

class _AllTabState extends State<AllTab> {
 late bool _isMusicTab = false;
 @override
 void initState(){
   super.initState();
   _isMusicTab = widget.isMusicTab;
 }
 final List<String> _artists = [
    "Drake",
    "Adele",
    "Billie Eilish",
    "Ed Sheeran",
    "Olivia Rodrigo",
    "Doja Cat",
    "The Weeknd",
    "Travis Scott",
    "BTS",
    "Kanye West",
  ];
 final List<String> _userLibraries = [
   'Klasik Rock Playlisti',
   '80\'ler Hit Şarkılar',
   'Jazz & Blues Seçkisi',
   'Akustik Dinlendirici',
   'Çalışma Müzikleri',
   'Favori Şarkılarım',
   'Türkçe Rap',
   'Indie Müzik Koleksiyonu',
   'Yaz Akşamı Playlisti',
   'Farklı Ritimler'
 ];

  @override
  Widget build(BuildContext context) {
    final localManager = Provider.of<LocalizationManager>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LibraryGrid(),
            const SizedBox(
              height: 10,
            ),
            !_isMusicTab
                ? NewReleaseRow(title: "new_releases_from",isSearch: false,)
                : const SizedBox.shrink(),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 140,
              child:  HorizontalScrollGrid(title:localManager.translate("jump_back_in"),cardTitles: _artists,icon: Icons.album_rounded,),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 140,
                child: HorizontalScrollGrid(cardTitles: _userLibraries, title: localManager.translate("recent_listened"), icon: Icons.library_music),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}


