import 'dart:async';
import 'package:eventease/screens/single_events_screens.dart';
import 'package:provider/provider.dart';

import 'package:eventease/models/events.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PopularEvents extends StatefulWidget {

  const PopularEvents({super.key});

  @override
  State<PopularEvents> createState() => _PopularEventsState();
}

class _PopularEventsState extends State<PopularEvents> {
  late final PageController _pageController;
  Timer? _timer;

  List<List<Events>> get eventGrid {
    final event = Provider.of<allEvents>(context, listen: false);
    final all =  event.events;

    List<List<Events>> grid = [];
    for (int i = 0; i < all.length; i += 2) {
      grid.add(all.skip(i).take(2).toList());
    }
    return grid;
  }

  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0);


    _timer = Timer.periodic(Duration(seconds: 2), (Timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.round() + 1;
        _pageController.animateToPage(
          nextPage, 
          duration: const Duration(milliseconds: 400), 
          curve: Curves.easeInOut
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
      height: 290,
      child: PageView.builder(
        controller: _pageController,
        itemCount: eventGrid.length * 1000,
        itemBuilder: (context, index) {
          final events = eventGrid[index % eventGrid.length];
          return GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: events.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2 / 3
      
            ), 
            itemBuilder: (context, index) {
              final event = events[index];
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFC2C2C2),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 220,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(event.eventimage),
                          fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.greenAccent
                                  ),
                                  child: Text("IDR ${event.eventprice.toStringAsFixed(0)}"),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    gradient: RadialGradient(
                                      center: AlignmentGeometry.center,
                                      radius: BorderSide.strokeAlignOutside,
                                      colors: [
                                        const Color.fromARGB(255, 196, 196, 196),
                                        const Color.fromARGB(255, 0, 0, 0),
                                      ]
                                    )
                                  ),
                                  child: Icon(
                                    event.isFavorite ? Icons.favorite : Icons.favorite_outline,
                                    color: Colors.white,
                                    size: 25,
                                  )
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(
                                        builder: (context) => SingleEventsScreens(eventId:event.id)
                                      ), 
                                    );
                                  },
                                  child: Text(
                                    event.eventtitle,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        DateFormat('MMM d').format(event.eventdate),
                                        style: TextStyle(
                                          color: Colors.white
                                        ),
                                      ),
                                      Icon(Icons.circle, size: 9, color: Colors.white,),
                                      Text(
                                        DateFormat('h:mm a').format(event.eventTime),
                                        style: TextStyle(
                                          color: Colors.white
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Join Event Now',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                        IconButton(
                          onPressed: () {}, 
                          icon: Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                          )
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