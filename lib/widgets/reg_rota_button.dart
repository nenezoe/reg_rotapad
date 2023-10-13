import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../utils/helpers.dart';

class RotaButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final VoidCallback? onTap;
  final bool isCustomYellowGradient;
  final double height;
  final double? width;

  const RotaButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.height = 40,
    this.width = 100,
    this.isCustomYellowGradient = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.black],
          ),
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              primary: color,
              // primary: Color(0xffC74444),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                // borderRadius: BorderRadius.circular(19),
                // borderRadius: BorderRadius.zero, //Rectangular border
              ),
            ),
            // style: ButtonStyle(
            //   elevation: MaterialStateProperty.all(0.0),
            //   backgroundColor:
            //       MaterialStateProperty.all(color ?? Colors.transparent),
            //   shape: MaterialStateProperty.all(
            //     RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            // ),

            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(20),
            //   //borderRadius: BorderRadius.zero, //Rectangular border
            // ),
            child: Text(
              text,
              style: Helpers.textStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }
}
