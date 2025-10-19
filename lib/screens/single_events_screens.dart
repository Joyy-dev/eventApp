import 'package:eventease/models/events.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleEventsScreens extends StatelessWidget {
  static const routeName = '/single-event-screens';
  final String eventId;

  const SingleEventsScreens({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<allEvents>(context, listen: false);
    final selectedEvent = eventProvider.events.firstWhere((event) => event.id == eventId,);
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.purpleAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)
          )
        ),
        child: BottomAppBar(
          color: const Color.fromARGB(0, 223, 64, 251),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: SvgPicture.asset('assets/icons/Frame (3).svg'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,                  children: [
                  Text(
                    'Continue Booking',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Let’s get new experience',
                    style: TextStyle(
                      fontSize: 17
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  )
                ),
                child: Text('IDR ${selectedEvent.eventprice}')
              )
            ],
          ),
        ),
      ),

      body: Container(
        child: Column(
          children: [
            Container(
              height: 400,
              padding: EdgeInsets.only(top: 50, left: 10, right: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(selectedEvent.eventimage),
                  fit: BoxFit.cover
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          }, 
                          icon: Icon(Icons.chevron_right)
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        selectedEvent.eventtitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}