import 'package:final_project/core/localization/locale_manager.dart';
import 'package:final_project/core/shared/navigation_drawer/drawer.dart';
import 'package:final_project/core/theme/theme_manager.dart';
import 'package:final_project/pages/home_page/AllTab/Widgets/new_release_row.dart';
import 'package:final_project/pages/profile_pages/profile_picture.dart';
import 'package:final_project/pages/search_page/category_grid.dart';
import 'package:final_project/pages/search_page/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final LocalizationManager localManager;
  final ThemeManager themeManager;
  const SearchPage(
      {super.key, required this.localManager, required this.themeManager});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(children: [
          const ProfilePicture(),
          const SizedBox(width: 10),
          Text(localManager.translate("search")),
        ]),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                    MaterialPageRoute(builder: (context)=>SearchBarPage(localManager: localManager,themeManager: themeManager,)),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: themeManager.themeMode == ThemeMode.dark ? Colors.grey[200] : Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Icon(Icons.search,color: themeManager.themeMode == ThemeMode.dark ? Colors.grey : Colors.black),
                        SizedBox(width: 10,),
                        Text(
                          localManager.translate("search"),
                          style: TextStyle(color: themeManager.themeMode == ThemeMode.dark ? Colors.grey : Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            NewReleaseRow(
              title: "picked_for_you",
              isSearch: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Text(
                    localManager.translate("browse_all"),
                    style: TextStyle(
                      color: themeManager.themeMode == ThemeMode.dark
                          ? Colors.white
                          : Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                CategoryGrid(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
