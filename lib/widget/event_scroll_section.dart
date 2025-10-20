import 'package:eventease/models/events.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class EventScrollSection extends StatelessWidget {
  const EventScrollSection({super.key});

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<allEvents>(context, listen: false);
    final selectedEvent = eventProvider.events.firstWhere((event) => event.id == event.id,);
    return DraggableScrollableSheet(
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
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset(
                        selectedEvent.eventimage,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            ),
         );
      },
    );
  }
}