import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Map<DateTime, String> _events = {};
  TextEditingController _eventController = TextEditingController();

  DateTime _selectedDay = DateTime.now();
  int _selectedYear = DateTime.now().year;

  final List<String> _months = [
    'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
    'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 12,
      vsync: this,
      initialIndex: _selectedDay.month - 1,
    );
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _selectedDay = DateTime(_selectedYear, _tabController.index + 1, 1);
          _eventController.text = _events[_selectedDay] ?? '';
        });
      }
    });
    _eventController.text = _events[_selectedDay] ?? '';
  }

  @override
  void dispose() {
    _tabController.dispose();
    _eventController.dispose();
    super.dispose();
  }

  int _getDaysInMonth(DateTime month) {
    return DateTime(month.year, month.month + 1, 0).day;
  }

  List<Widget> _buildDayLabels() {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return days.map((day) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Center(
          child: Text(
            day,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }).toList();
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
              _eventController.text = _events[_selectedDay] ?? '';
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
                        offset: const Offset(0, 2),
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

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Event berhasil ditambahkan pada ${_selectedDay.day} ${_months[_selectedDay.month - 1]} $_selectedYear'),
          backgroundColor: Colors.teal,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _deleteEvent() {
    if (_events.containsKey(_selectedDay)) {
      setState(() {
        _events.remove(_selectedDay);
        _eventController.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Event dihapus dari ${_selectedDay.day} ${_months[_selectedDay.month - 1]} $_selectedYear'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 12,
      initialIndex: DateTime.now().month - 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Schedule'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: _months.map((month) => Tab(text: month)).toList(),
          ),
          actions: [
            PopupMenuButton<int>(
              icon: Text(
                '$_selectedYear',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onSelected: (int selectedYear) {
                setState(() {
                  _selectedYear = selectedYear;
                  _selectedDay = DateTime(selectedYear, _selectedDay.month, _selectedDay.day);
                  _eventController.text = _events[_selectedDay] ?? '';
                });
              },
              itemBuilder: (context) {
                List<PopupMenuEntry<int>> items = [];
                for (int i = 0; i < 9; i++) {
                  int year = 2022 + i;
                  items.add(
                    PopupMenuItem(
                      value: year,
                      child: Text(year.toString()),
                    ),
                  );
                  if (i < 8) {
                    items.add(const PopupMenuDivider(height: 0.5));
                  }
                }
                return items;
              },
            ),
          ],
        ),
        body: Column(
          children: [
            const Divider(height: 1, thickness: 1),
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
            const Divider(height: 1, thickness: 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _eventController,
                maxLines: 3,
                maxLength: 200,
                inputFormatters: [LengthLimitingTextInputFormatter(200)],
                decoration: const InputDecoration(
                  hintText: 'Add event (max 3 lines)',
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
                onSubmitted: (_) => _saveEvent(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _saveEvent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Simpan Event'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _deleteEvent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Hapus Event'),
                ),
              ],
            ),
            const Divider(height: 1, thickness: 1),
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
      ),
    );
  }
}