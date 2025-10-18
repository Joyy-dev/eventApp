import 'package:flutter/material.dart';

class Events {
  final String id;
  final String eventtitle;
  final DateTime eventdate;
  final DateTime eventTime;
  final String eventlocation;
  final String eventimage;
  final String eventdescription;
  final double eventprice;
  final String eventcategory;
  final bool isFavorite;

  Events({
    required this.id,
    required this.eventtitle,
    required this.eventdate,
    required this.eventTime,
    required this.eventlocation,
    required this.eventimage,
    required this.eventdescription,
    required this.eventprice,
    required this.eventcategory,
    this.isFavorite = false,
  });
}

class allEvents with ChangeNotifier {
  final List<Events> _allEvents = [
  Events(
    id: 'e1',
    eventtitle: 'Creativity Denver Brass Orchestra Concert',
    eventdate: DateTime(2025, 9, 7),
    eventTime: DateTime(2025, 9, 7, 10, 00),
    eventlocation: 'Denver, CO',
    eventimage: 'assets/images/orchestra.png',
    eventdescription:
        'Experience an unforgettable evening with the Creativity Denver Brass Orchestra. Join us for a night filled with mesmerizing melodies and powerful performances that will leave you inspired.',
    eventprice: 45000.00,
    eventcategory: 'Music',
  ),
  Events(
    id: 'e2',
    eventtitle: 'Jakarta Final Match Football Internasional',
    eventdate: DateTime(2025, 12, 18),
    eventTime: DateTime(2025, 12, 18, 10, 00),
    eventlocation: 'Jakarta, Indonesia',
    eventimage: 'assets/images/football.png',
    eventdescription:
        'Witness the thrilling final match of the international football tournament in Jakarta. Cheer for your favorite teams as they battle for glory in an electrifying atmosphere.',
    eventprice: 75000.00,
    eventcategory: 'Sports',
  ),
  Events(
    id: 'e3',
    eventtitle: 'Java Jazz Festival 2024',
    eventdate: DateTime(2026, 04, 15),
    eventTime: DateTime(2026, 04, 15, 16, 30),
    eventlocation: 'Jakarta, Indonesia',
    eventimage: 'assets/images/jazz.png',
    eventdescription:
        'Join us at the Java Jazz Festival 2024 for a celebration of jazz music like no other. Enjoy performances by world-renowned artists and immerse yourself in the soulful rhythms of jazz.',
    eventprice: 60000.00,
    eventcategory: 'Music',
  ),
  Events(
    id: 'e4',
    eventtitle: 'Coldplay Music Concert',
    eventdate: DateTime(2026, 05, 25,),
    eventTime: DateTime(2026, 05, 25, 00, 00),
    eventlocation: 'Los Angeles, CA',
    eventimage: 'assets/images/music.png',
    eventdescription:
        'Experience the magic of Coldplay live in concert. Sing along to their greatest hits and be part of an unforgettable night filled with energy and emotion.',
    eventprice: 120000.00,
    eventcategory: 'Music',
  ),
  Events(
    id: 'e5',
    eventtitle: 'Theatre: Speech of Love Story',
    eventdate: DateTime(2025, 11, 26),
    eventTime: DateTime(2025, 11, 26, 04, 30),
    eventlocation: 'New York, NY',
    eventimage: 'assets/images/theatre.png',
    eventdescription:
        'Dive into a captivating love story brought to life on stage. Experience the drama, passion, and emotion of this theatrical masterpiece that will leave you breathless.',
    eventprice: 55000.00,
    eventcategory: 'Theatre',
  ),
  Events(
    id: 'e6',
    eventtitle: 'Interior Design Exhibition 2024',
    eventdate: DateTime(2025, 10, 26),
    eventTime: DateTime(2025, 10, 26, 14, 00),
    eventlocation: 'Milan, Italy',
    eventimage: 'assets/images/fashion.png',
    eventdescription:
        'Explore the latest trends in interior design at the Interior Design Exhibition 2024. Discover innovative ideas and creative solutions to transform your living spaces.',
    eventprice: 30000.00,
    eventcategory: 'Fashion',
  ),
  Events(
    id: 'e7',
    eventtitle: 'Music Charity at Melo Auditorium',
    eventdate: DateTime(2026, 01, 30),
    eventTime: DateTime(2026, 01, 30, 15, 30),
    eventlocation: 'Chicago, IL',
    eventimage: 'assets/images/charity.png',
    eventdescription:
        'Join us for a night of music and giving back at the Music Charity event at Melo Auditorium. Enjoy performances by talented artists while supporting a worthy cause.',
    eventprice: 40000.00,
    eventcategory: 'Charity',
  ),
  Events(
    id: 'e8',
    eventtitle: 'Music Charity at Melo Auditorium',
    eventdate: DateTime(2026, 01, 30),
    eventTime: DateTime(2026, 01, 30, 15, 30),
    eventlocation: 'Chicago, IL',
    eventimage: 'assets/images/concert.png',
    eventdescription:
        'Join us for a night of music and giving back at the Music Charity event at Melo Auditorium. Enjoy performances by talented artists while supporting a worthy cause.',
    eventprice: 40000.00,
    eventcategory: 'Charity',
  ),
];
List<Events> get events {
  return [..._allEvents];
}
}