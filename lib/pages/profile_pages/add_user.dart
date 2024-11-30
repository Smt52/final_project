import 'package:final_project/core/localization/locale_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUserPage extends StatelessWidget{
@override
  Widget build(BuildContext context) {
  final localManager = Provider.of<LocalizationManager>(context);
    return Scaffold(
      body:Center(
        child: Text(
            localManager.translate("add_user"),
          style:const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}