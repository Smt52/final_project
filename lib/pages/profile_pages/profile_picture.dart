import 'package:flutter/material.dart';


class ProfilePicture extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.grey[300],
        child: const Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
    );
  }
}