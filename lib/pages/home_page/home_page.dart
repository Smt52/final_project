import 'package:final_project/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/localization/locale_manager.dart';
import 'home_tab.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  _HomePageState createState()=>_HomePageState();
}


class _HomePageState extends State<HomePage>
{
  int _selectedIndex = 0;
    final List<Widget> _tabs =[
      const HomeTab(),
    ];


    void _onItemTab(int index){
      setState(() {
        _selectedIndex = index;
      });
    }

    @override
    Widget build(BuildContext context){
      final localManager = Provider.of<LocalizationManager>(context);
      return Scaffold(
        backgroundColor: Colors.black,
        body: IndexedStack(
          index: _selectedIndex,
          children: _tabs,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ConstColors.primaryBackground,
          currentIndex: _selectedIndex,
          onTap: _onItemTab ,
          selectedItemColor:Colors.white,
          unselectedItemColor:Colors.grey.shade100,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex==0?Icons.home_filled:Icons.home_outlined
                ),
                label: localManager.translate("home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex==1?Icons.search_rounded:Icons.search
              ),
              label: localManager.translate("search"),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  _selectedIndex==2?Icons.library_music:Icons.library_music_outlined
                ),
              label: localManager.translate("library")
            )
          ],
        ),
      );
    }
}