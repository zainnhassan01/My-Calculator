import 'package:flutter/material.dart';

class ButtonPress extends StatelessWidget {
  const ButtonPress({super.key, this.buttonName, this.buttonColor, this.onPressed});
  final buttonName;
  final buttonColor;
  final onPressed;
  @override
  Widget build(BuildContext context) {
  final h = MediaQuery.sizeOf(context).height;
  final w = MediaQuery.sizeOf(context).width;
    return  InkWell(
        onTap: onPressed,
        child: Container(
          height: h * 0.08,
          width: w * 0.18,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttonColor,
          ),
          child: Center(child: Text(buttonName,style: const TextStyle(fontFamily: 'EurostileFont',fontSize: 42,fontWeight: FontWeight.bold),)),
        ),
    );
  }
}