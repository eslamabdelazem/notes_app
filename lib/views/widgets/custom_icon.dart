import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({required this.onTap,required this.icon,super.key});
  final Icon icon;
 final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.05),borderRadius: BorderRadius.circular(16)),
        child: Center(child: icon),
      ),
    );
  }
}
