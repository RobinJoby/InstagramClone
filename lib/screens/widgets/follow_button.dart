import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  
  final Function()? function;
  final Color backgroudColor;
  final Color borederColor;
  final String text;
  final Color textColor;

  const FollowButton({
    super.key,
    this.function,
    required this.backgroudColor,
    required this.borederColor,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: TextButton(
        onPressed: function,
        child: Container(
          decoration: BoxDecoration(
            color: backgroudColor,
            border: Border.all(
              color: borederColor,
            ),
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          width: 200,
          height: 27,
        ),
      ),
    );
  }
}
