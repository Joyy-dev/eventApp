import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreens extends StatelessWidget {
  const WelcomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsetsGeometry.only(top: 150, bottom: 50),
          color: Color.fromARGB(255, 252, 252, 252),
          child: Column(        
            children: [
              Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bg.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.center
                ),
              )),
              Text('Elevate Your Experiences',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 33, 33, 33)
              ),),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Lorem ipsum dolor sit amet consectetur. Enim pharetra id faucibus proin leo ultrices facilisis non. Rhoncus vel arcu et sed nisl vitae suspendisse accumsan.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 117, 117, 117)
                ),),
              ),
              SizedBox(height: 22,),
              SvgPicture.asset(
                'assets/icons/vol.svg',
                width: 30,
              ),
              SizedBox(height: 25,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                margin: EdgeInsets.symmetric(horizontal: 58, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {}, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      child: Text('Get Started Now')
                    ),
                    SizedBox(width: 20,),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon( 
                        Icons.arrow_forward_rounded, 
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
              // ElevatedButton.icon(
              //   onPressed: () {},
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.black,
              //     foregroundColor: Colors.white,
              //     padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
              //     textStyle: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold
              //     ),
              //   ),
              //   icon: Icon(
              //     Icons.arrow_forward_rounded, 
              //     size: 16,
              //   ),
              //   label: Text('Get Started Now'),
              // ),             
            ],
          ),
        ),
      )
    );
  }
}