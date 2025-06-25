import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime _selectedDay = DateTime.now();
  TextEditingController _eventController = TextEditingController();
  Map<DateTime, String> _events = {};

  int _getDaysInMonth(DateTime month) {
    return DateTime(month.year, month.month + 1, 0).day;
  }

  List<Widget> _buildDayLabels() {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return days
        .map(
          (day) => Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: Text(
                day,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
        .toList();
  }

  List<Widget> _buildCalendar() {
    int daysInMonth = _getDaysInMonth(_selectedDay);
    int firstDayOfWeek = DateTime(_selectedDay.year, _selectedDay.month, 1).weekday;
    int emptyDays = firstDayOfWeek % 7;

    List<Widget> calendarDays = [];

    for (int i = 0; i < emptyDays; i++) {
      calendarDays.add(Container());
    }

    for (int day = 1; day <= daysInMonth; day++) {
      DateTime dayDate = DateTime(_selectedDay.year, _selectedDay.month, day);
      bool isSelected = dayDate.year == _selectedDay.year &&
          dayDate.month == _selectedDay.month &&
          dayDate.day == _selectedDay.day;

      calendarDays.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedDay = dayDate;
              _eventController.text = _events[dayDate] ?? '';
            });
          },
          child: Container(
            margin: const EdgeInsets.all(2.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isSelected ? Colors.teal : Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(6),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ]
                  : [],
            ),
            child: Center(
              child: Text(
                '$day',
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return calendarDays;
  }

  void _saveEvent() {
    if (_eventController.text.trim().isNotEmpty) {
      setState(() {
        _events[_selectedDay] = _eventController.text.trim();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
        backgroundColor: Colors.teal,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: _buildDayLabels().map((label) {
                return Expanded(child: label);
              }).toList(),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 7,
              childAspectRatio: 1,
              children: _buildCalendar(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _eventController,
              maxLines: 3,
              maxLength: 200, 
              inputFormatters: [
                LengthLimitingTextInputFormatter(200),
              ],
              decoration: const InputDecoration(
                hintText: 'Add event (max 3 lines)',
                border: OutlineInputBorder(),
                counterText: '', 
              ),
              onSubmitted: (_) => _saveEvent(),
            ),
          ),
          ElevatedButton(
            onPressed: _saveEvent,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
            ),
            child: const Text('Save Event'),
          ),
          if (_events[_selectedDay] != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Event: ${_events[_selectedDay]}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}