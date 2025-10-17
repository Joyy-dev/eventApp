import 'package:eventease/screens/events_screens.dart';
import 'package:eventease/widget/welcome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreens extends StatelessWidget {
  const WelcomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsetsGeometry.only(top: 100, bottom: 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topRight,
              colors: [
                Colors.white,
                Colors.white,
                const Color.fromARGB(255, 207, 179, 255),
              ]
            )
          ),
          child: Column(        
            children: [
              Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bg.png'
                    ),
                    fit: BoxFit.cover,
                    alignment: Alignment.center
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 500,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset(
                          'assets/images/joint.png'
                        ).image,
                      )
                    ),
                    child: Transform.translate(
                      offset: Offset(80, -140),
                      child: Container(
                        height: 65,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          color: Colors.white
                        ),
                        child: WelcomeIcons()
                      ),
                    ),
                  )
                ],
              )),
              Text('Elevate Your Experiences',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Calibri',
                color: Color.fromARGB(255, 33, 33, 33)
              ),),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('Lorem ipsum dolor sit amet consectetur. Enim pharetra id faucibus proin leo ultrices facilisis non. Rhoncus vel arcu et sed nisl vitae suspendisse accumsan.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Calibri',
                  color: Color.fromARGB(255, 117, 117, 117)
                ),),
              ),
              SizedBox(height: 22,),
              SvgPicture.asset(
                'assets/icons/vol.svg',
                width: 30,
              ),
              SizedBox(height: 25,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(EventsScreens.routeName);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                  margin: EdgeInsets.symmetric(horizontal: 68, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(EventsScreens.routeName);
                        }, 
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
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}