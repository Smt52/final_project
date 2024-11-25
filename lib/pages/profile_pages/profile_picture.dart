import 'package:flutter/material.dart';


class ProfilePicture extends StatelessWidget{
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.grey[300],
        child: const Icon(
          size: 30,
          Icons.person,
          color: Colors.white,
        ),
      ),
    );
  }
}