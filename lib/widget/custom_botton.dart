import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 20.0,
      color: Colors.white,
      elevation: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.home_rounded, size: 30,)
              ),
              SizedBox(width: 20,),
              IconButton(
                onPressed: () {}, 
                icon: SvgPicture.asset('assets/icons/Frame (3).svg', width: 30,),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.favorite_border_outlined, size: 30,),
              ),
              SizedBox(width: 20,),
              IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.person_outlined, size: 30,)
              )
            ],
          )
        ],
      ),
   );
  }
}