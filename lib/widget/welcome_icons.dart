import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeIcons extends StatelessWidget {
  const WelcomeIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.amberAccent,
            ),
            child: SvgPicture.asset(
              'assets/icons/Frame (1).svg',
              width: 25,
            ),
          ),
          SizedBox(width: 10,),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.purpleAccent
            ),
            child: SvgPicture.asset(
              'assets/icons/Frame (2).svg',
              width: 25,
            ),
          ),
          SizedBox(width: 10,),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.greenAccent
            ),
            child: SvgPicture.asset(
             'assets/icons/Frame.svg',
              width: 25,
            ),
        ),
      ],
    );
  }
}