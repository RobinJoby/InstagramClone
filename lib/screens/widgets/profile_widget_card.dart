import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class ProfileCard extends StatelessWidget {
  final String label;
  final int num;

  const ProfileCard({super.key, required this.label, required this.num});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
