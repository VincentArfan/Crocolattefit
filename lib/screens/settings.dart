import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkMode = false;
  bool isNotificationOn = true;
  bool isSoundOn = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        backgroundColor: Colors.teal,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: isDarkMode,
            onChanged: (bool value) {
              setState(() {
                isDarkMode = value;
              });
            },
            secondary: const Icon(Icons.dark_mode),
          ),
          SwitchListTile(
            title: const Text('Notification'),
            value: isNotificationOn,
            onChanged: (bool value) {
              setState(() {
                isNotificationOn = value;
              });
            },
            secondary: const Icon(Icons.notifications),
          ),
          SwitchListTile(
            title: const Text('Suara Notifikasi'),
            value: isSoundOn,
            onChanged: (bool value) {
              setState(() {
                isSoundOn = value;
              });
            },
            secondary: const Icon(Icons.music_note),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Privacy Policy'),
                  content: const Text('Aplikasi ini mengumpulkan informasi pribadi dan kesehatan pengguna untuk menyediakan layanan kesehatan yang lebih baik. Kami mengumpulkan data seperti nama, email, informasi kesehatan, dan data aktivitas fisik untuk memberikan rekomendasi yang lebih personal. Kami menjaga privasi Anda dengan mengenkripsi data dan hanya berbagi informasi dengan pihak ketiga yang dipercaya untuk tujuan analisis atau peningkatan layanan.Kami tidak membagikan data pribadi Anda untuk tujuan iklan tanpa persetujuan Anda. Anda dapat mengakses, memperbaiki, atau menghapus data pribadi kapan saja melalui pengaturan akun Anda. Untuk informasi lebih lanjut tentang hak Anda dan cara kami melindungi data Anda, silakan baca kebijakan privasi kami secara lengkap.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Tutup'),
                    ),
                  ],
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Version'),
            trailing: const Text('1.0.0'),
          ),
        ],
      ),
    );
  }
}