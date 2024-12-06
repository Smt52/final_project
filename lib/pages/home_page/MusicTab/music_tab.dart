import 'package:final_project/pages/home_page/AllTab/alltab.dart';
import 'package:flutter/material.dart';



class MusicTab extends StatelessWidget
{
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: AllTab(isMusicTab: true,),
    );
  }
}