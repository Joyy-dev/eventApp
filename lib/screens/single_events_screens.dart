import 'package:eventease/models/events.dart';
import 'package:eventease/widget/event_scroll_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

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

      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
          height: 430,
          padding: EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 40),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(selectedEvent.eventimage),
              fit: BoxFit.cover,
              opacity: 10
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      icon: Icon(Icons.chevron_left),
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.black,
                        child: IconButton(
                          onPressed: () {}, 
                          icon: Icon(Icons.file_download_outlined)
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.black,
                        child: IconButton(
                          onPressed: () {}, 
                          icon: Icon(Icons.more_horiz_outlined)
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedEvent.eventtitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        DateFormat('MMM d').format(selectedEvent.eventdate),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18
                        ),
                      ),
                      SizedBox(width: 10,),
                      Icon(Icons.circle, color: Colors.white, size: 10,),
                      SizedBox(width: 10,),
                      Text(
                        DateFormat('h:mm a').format(selectedEvent.eventTime),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        EventScrollSection()
        ],
      ),
    );
  }
}