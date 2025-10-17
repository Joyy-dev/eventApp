import 'package:flutter/material.dart';

class EventSearch extends StatefulWidget {
  const EventSearch({super.key});

  @override
  State<EventSearch> createState() => _EventSearchState();
}

class _EventSearchState extends State<EventSearch> {
  final TextEditingController _controller = TextEditingController();

  final List<String> allEvents = [
    'Creativity Denver Brass  Orchestra Concert',
    'Jakarta Final Match Football Internasional',
    'Java Jazz Festival 2024',
    'Coldplay Music Concert',
    'Theatre: Speech of Love Story',
    'Interior Design Exhibition 2024',
    'Music Charity at Melo Auditorium',
  ];

  List<String> filteredEvents = [];

  @override
  void initState() {
    super.initState();
    filteredEvents = allEvents;
  }

    void _filterEvents(String query) {
      setState(() {
        if (query.isEmpty) {
          filteredEvents = allEvents;
          return;
        } else {
          filteredEvents = allEvents
              .where(
                (event) => event.toLowerCase().
                contains(query.toLowerCase()
              )
            ).toList();
          }
        }
      );
    }

  @override

  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: _filterEvents,
      decoration: InputDecoration(
        hintText: 'Search event, concert or other...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.grey.shade300
          )
        )
      ),
    );
  }
}