import 'package:eventease/widget/custom_botton.dart';
import 'package:eventease/widget/event_search.dart';
import 'package:flutter/material.dart';

class EventsScreens extends StatelessWidget {
  static const routeName = '/events-screens';
  const EventsScreens({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF775BE5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        child: Icon(
          Icons.qr_code_rounded,
          size: 30,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBotton(),

      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Find events near'),
                            Row(
                              children: [
                                Text(
                                  'Jakarta, Indonesia', 
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold
                                  ),),
                                Icon(Icons.arrow_drop_down_outlined, size: 30,)
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {}, 
                      icon: Icon(Icons.notifications_none_outlined)
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/concert.png'),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 30,),
            EventSearch(),
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  'Popular event',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.chevron_right)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}