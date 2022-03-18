import 'package:flutter/material.dart';

class RoundedTopButton extends StatelessWidget {
  const RoundedTopButton({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.iconColor,
    required this.buttonColor,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor, buttonColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(color: iconColor, width: 1.5),
          shape: BoxShape.circle,
          color: buttonColor,
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}
