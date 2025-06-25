import 'package:flutter/material.dart';

class Bahasa extends StatefulWidget {
  const Bahasa({super.key});

  @override
  State<Bahasa> createState() => _BahasaState();
}

class _BahasaState extends State<Bahasa> {
  String? selectedLanguage;

  final List<String> languages = [
    'Indonesia',
    'English',
    'Español',
    'Français',
    'Deutsch',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bahasa'),
        backgroundColor: Colors.teal,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilihlah bahasa yang ingin anda pakai',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              hint: const Text('Pilih Bahasa'),
              value: selectedLanguage,
              isExpanded: true,
              items: languages.map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
