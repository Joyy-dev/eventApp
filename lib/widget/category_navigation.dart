import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryNavigation extends StatelessWidget {
  const CategoryNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 19, 75, 21),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Icon(
                  Icons.qr_code,
                  color: Colors.white,
                  size: 16,
                )
              ),
              Text(
                'Discover',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amber,
                ),
                child: SvgPicture.asset('assets/icons/Frame (4).svg', fit: BoxFit.cover, width: 17,),
              ),
              Text(
                'Music',
                style: TextStyle(
                  fontSize: 16
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.purple
                ),
                child: Icon(Icons.sports_basketball_outlined, color: Colors.white, size: 15,),
              ),
              Text(
                'Sports',
                style: TextStyle(
                  fontSize: 16
                ),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white
          ),
          child: IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.more_horiz_outlined)
          ),
        )
      ],
    );
  }
}