import 'dart:async';
import 'package:eventease/screens/single_events_screens.dart';
import 'package:intl/intl.dart';

import 'package:eventease/models/events.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NearbyEvents extends StatefulWidget {
  const NearbyEvents({super.key});

  @override
  State<NearbyEvents> createState() => _NearbyEventsState();
}

class _NearbyEventsState extends State<NearbyEvents> {
  late final PageController _pageController;
  Timer? _timer;

  List<List<Events>> get nearbyEventGrid {
    final event = Provider.of<allEvents>(context);
    final nearEvent =  event.events;

    List<List<Events>> eventGrid = [];
    for (int i = 0; i < nearEvent.length; i += 3) {
      eventGrid.add(nearEvent.skip(i).take(3).toList());
    }
    return eventGrid;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer) {
    if (_pageController.hasClients) {
      int nextPage = _pageController.page!.round() + 1;
      _pageController.animateToPage(
        nextPage, 
        duration: Duration(milliseconds: 400), 
        curve: Curves.easeInOut,
      );
    }
  });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: PageView.builder(
        controller: _pageController,
        itemCount: nearbyEventGrid.length * 1000,
        itemBuilder: (context, index) {
          final NearbyEvents = nearbyEventGrid[index % nearbyEventGrid.length];
          return GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: NearbyEvents.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 5 / 8
            ), 
            itemBuilder: (context, index) {
              final event = NearbyEvents[index];
      
              return Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(event.eventimage),
                    fit: BoxFit.cover
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(''),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          child: Icon(event.isFavorite ? Icons.favorite : Icons.favorite_border_outlined),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SingleEventsScreens(eventId: event.id)));
                          },
                          child: Text(
                            event.eventtitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                        ),
                        Text(
                          DateFormat('MMM d').format(event.eventdate),
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
          );
        },
      ),
    );
  }
}