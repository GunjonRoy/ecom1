import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Color(0xffffaf38),
            borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
