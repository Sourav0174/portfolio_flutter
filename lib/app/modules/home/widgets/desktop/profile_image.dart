import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CircleAvatar(
          radius: double.infinity,
          backgroundColor: Colors.transparent,
          child: Image.asset(
            "assets/images/profile1.png",
            fit: BoxFit.cover,
            height: height * 0.6,
            width: height * 0.6,
          ),
        ),
      ],
    );
  }
}
