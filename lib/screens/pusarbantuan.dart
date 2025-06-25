import 'package:flutter/material.dart';

class PusatBantuan extends StatelessWidget {
  const PusatBantuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pusat Bantuan'),
        backgroundColor: Colors.teal,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Pertanyaan yang Sering Diajukan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ExpansionTile(
            title: const Text('Bagaimana cara mendaftar akun?'),
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Buka aplikasi, lalu tekan tombol "Daftar". Isi data diri dan ikuti instruksi.'),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Bagaimana cara mengganti kata sandi?'),
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Masuk ke menu "Pengaturan", lalu pilih "Ubah Kata Sandi".'),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Bagaimana cara menghapus akun saya?'),
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Silakan hubungi kami melalui email support untuk proses penghapusan akun.'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Panduan Penggunaan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            '• Gunakan menu navigasi bawah untuk berpindah halaman.\n'
            '• Klik ikon "+" untuk menambahkan entri baru.\n'
            '• Untuk bantuan lebih lanjut, hubungi tim support.',
          ),
          const SizedBox(height: 20),
          const Text(
            'Hubungi Kami',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            '📧 Email: Crocolattefit@aplikasi.com\n'
            '📞 Telepon: 021-12345678\n'
            '💬 WhatsApp: 0812-3456-7890',
          ),
        ],
      ),
    );
  }
}