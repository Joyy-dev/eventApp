import 'package:eventease/models/events.dart';
import 'package:eventease/widget/event_map.dart';
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
              fit: BoxFit.cover
            )
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
        DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 1 / 2,
          maxChildSize: 0.6,
          builder: (context, scrollController) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              )
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Event Schedule',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.linear_scale_outlined, color: Color(0xFFA183DB),),
                            SizedBox(width: 5,),
                            Text(
                              'Day 1',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              DateFormat('E, MMM d y').format(selectedEvent.eventdate),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17
                              ),
                            ),
                            SizedBox(width: 7,),
                            Icon(Icons.circle, size: 5,),
                            SizedBox(width: 7,),
                            Text(
                              DateFormat('h:mm a').format(selectedEvent.eventTime),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.linear_scale_outlined, color: Color(0xFF74CA8D),),
                            SizedBox(width: 5,),
                            Text(
                              'Day 2',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              DateFormat('E, MMM d y').format(selectedEvent.eventdate),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17
                              ),
                            ),
                            SizedBox(width: 7,),
                            Icon(Icons.circle, size: 5,),
                            SizedBox(width: 7,),
                            Text(
                              DateFormat('h:mm a').format(selectedEvent.eventTime),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'About',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      selectedEvent.eventdescription,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 10,),
                    Text(
                      'Location',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Exbract Venue Auditorium',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedEvent.eventlocation,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            side: BorderSide(
                              width: 2,
                              color: Colors.black
                            ),
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            )
                          ),
                          child: Text('Get Direction')
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    EventMap()
                  ],
                ),
              ),
            ),
         );
        },
        ),
        ],
      ),
    );
  }
}