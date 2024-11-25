import 'package:final_project/pages/home_page/AllTab/Widgets/new_release_row.dart';
import 'package:flutter/material.dart';

import 'Widgets/horizontal_grid.dart';
import 'Widgets/library_grid.dart';

class AllTab extends StatefulWidget {
  const AllTab({super.key});

  @override
  _AllTabState createState() => _AllTabState();
}

class _AllTabState extends State<AllTab> {
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            LibraryGrid(),
            const SizedBox(
              height: 10,
            ),
              NewReleaseRow(),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 140,
              child:  HorizontalScrollGrid(title:"Jump back in",cardTitles: _artists,icon: Icons.album_rounded,),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 140,
                child: HorizontalScrollGrid(cardTitles: _userLibraries, title: "Recents", icon: Icons.library_music),
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


