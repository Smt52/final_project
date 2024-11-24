import 'package:final_project/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'home_tab.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()=>_HomePageState();
}


class _HomePageState extends State<HomePage>
{
  int _selectedIndex = 0;
    final List<Widget> _tabs =[
      HomeTab(),
    ];


    void _onItemTab(int index){
      setState(() {
        _selectedIndex = index;
      });
    }

    @override
    Widget build(BuildContext context){
      return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _tabs,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTab ,
          selectedItemColor: ConstColors.buttonSelected,
          unselectedItemColor:ConstColors.buttonUnselected,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex==0?Icons.home_filled:Icons.home_outlined
                ),
                label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex==1?Icons.search_rounded:Icons.search
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  _selectedIndex==2?Icons.library_music:Icons.library_music_outlined
                ),
              label: "Your Library"
            )
          ],
        ),
      );
    }
}