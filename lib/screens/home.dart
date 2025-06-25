import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.monitor_weight, 'label': 'Kalkulator BMI'},
    {'icon': Icons.local_fire_department, 'label': 'Kalkulator Kebutuhan Kalori'},
    {'icon': Icons.favorite, 'label': 'Kalkulator Detak Jantung Maksimum'},
    {'icon': Icons.fitness_center, 'label': 'Kalkulator Lemak Tubuh'},
    {'icon': Icons.water_drop, 'label': 'Kalkulator Asupan Air Harian'},
    {'icon': Icons.accessibility_new, 'label': 'Kalkulator WHR (Waist-to-Hip Ratio)'},
  ];

  List<Map<String, dynamic>> visitPlans = [
    {'title': 'lari jogging 1 jam', 'done': false},
    {'title': 'makan buah jam 5', 'done': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.teal,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),

      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                _sectionTitle('Schedule kesehatan hari ini'),
                ...visitPlans
                    .where((item) => !item['done'])
                    .map((item) => _visitCard(context, item['title']))
                    .toList(),

                const SizedBox(height: 20),

                _sectionTitle('Schedule yang sudah selesai hari ini'),
                ...visitPlans
                    .where((item) => item['done'])
                    .map((item) => _doneCard(item['title']))
                    .toList(),
              ],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: menuItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Klik: ${menuItems[index]['label']}')),
                          );
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(menuItems[index]['icon'], color: Colors.teal, size: 22),
                            const SizedBox(height: 6),
                            Text(
                              menuItems[index]['label'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              _sectionTitle('Schedule kesehatan hari ini', trailing: 'Lihat Detail Plan'),
              ...visitPlans
                  .where((item) => !item['done'])
                  .map((item) => _visitCard(context, item['title']))
                  .toList(),

              const SizedBox(height: 20),

              _sectionTitle('Schedule yang sudah selesai hari ini'),
              ...visitPlans
                  .where((item) => item['done'])
                  .map((item) => _doneCard(item['title']))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, {String? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.teal,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (trailing != null)
            Text(
              trailing,
              style: const TextStyle(color: Colors.blue, fontSize: 12),
            ),
        ],
      ),
    );
  }

  Widget _visitCard(BuildContext context, String title) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Rencana $title',
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final index = visitPlans.indexWhere((item) => item['title'] == title);
                  if (index != -1) visitPlans[index]['done'] = true;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$title selesai dilakukan!')),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                backgroundColor: Colors.teal,
              ),
              child: const Text('Selesai', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _doneCard(String title) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final index = visitPlans.indexWhere((item) => item['title'] == title);
                  if (index != -1) visitPlans[index]['done'] = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$title dikembalikan ke rencana')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('Cancel', style: TextStyle(fontSize: 12, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
