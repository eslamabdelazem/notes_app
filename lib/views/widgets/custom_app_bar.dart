import 'package:flutter/material.dart';
import 'package:notes/views/widgets/custom_icon.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.icon,required this.title,super.key, required this.onTap});
  final String title;
  final Icon icon;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(fontSize: 24),),
        CustomIcon(icon:icon,onTap: onTap),
      ],
    );
  }
}
