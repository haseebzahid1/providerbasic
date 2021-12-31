import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color? btnColor ;
  final Color? btnTextColor;
  void Function()? onPress;
  final String? text;
   RoundIconButton({Key? key,
     required this.icon,
     required this.onPress,
     this.btnColor,
     this.btnTextColor,
     this.text,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,color: btnTextColor,),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      // shape: CircleBorder(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      fillColor: btnColor??Color(0xFF4C4F5E),
      onPressed: onPress,

    );
  }}