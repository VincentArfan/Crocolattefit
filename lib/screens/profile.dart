import 'package:croco/screens/bahasa.dart';
import 'package:croco/screens/pusarbantuan.dart';
import 'package:croco/screens/settings.dart';
import 'package:croco/screens/verifikasi.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Konfirmasi Logout"),
                    content: const Text("Apakah Anda yakin ingin logout?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Batal"),
                      ),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Berhasil logout')),
                          );
                          Navigator.of(context).pop();
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text("Logout"),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Nama",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Age: 25",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.edit, color: Colors.teal),
                    title: const Text("Edit Profile"),
                    onTap: () {
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.lock, color: Colors.teal),
                    title: const Text("Ubah Password"),
                    onTap: () {
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.teal),
                    title: const Text("Pengaturan"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Settings()),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.language, color: Colors.teal),
                    title: const Text("Bahasa"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Bahasa()),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.help, color: Colors.teal),
                    title: const Text("Pusat Bantuan"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PusatBantuan()),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.feedback, color: Colors.teal),
                    title: const Text("Beri Masukkan"),
                    onTap: () {
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app, color: Colors.teal),
                    title: const Text("Keluar"),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Konfirmasi"),
                            content: const Text("Apakah Anda yakin ingin keluar?"),
                            actions: [
                              TextButton(
                                child: const Text("Batal"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text("Keluar"),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Berhasil logout')),
                                  );
                                  Navigator.of(context).pop();
                                  Navigator.pushReplacementNamed(context, '/login');
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}