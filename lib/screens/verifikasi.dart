import 'dart:math';
import 'package:flutter/material.dart';

class Verifikasi extends StatelessWidget {
  const Verifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
    final List<TextEditingController> controllers = List.generate(6, (index) => TextEditingController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Kode OTP"),
        titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Masukkan kode OTP yang dikirim ke nomor Anda",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 45,
                      child: TextField(
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal, width: 2),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 5) {
                            FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                          } else if (value.isEmpty && index > 0) {
                            FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                          }
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    String otp = controllers.map((c) => c.text).join();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Kode OTP"),
                        content: Text("OTP yang dimasukkan: $otp"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: const Text("Verifikasi", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    final randomCode = Random().nextInt(900000) + 100000;
                    ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                        content: Text('Kode verifikasi via Email: $randomCode'),
                        backgroundColor: const Color.fromARGB(255, 114, 114, 114),
                        actions: [
                          TextButton(
                            onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                            child: const Text('Tutup'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Verifikasi menggunakan Email",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    final randomCode = Random().nextInt(900000) + 100000;
                    ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                        content: Text('Kode verifikasi via No HP: $randomCode'),
                        backgroundColor: const Color.fromARGB(255,  114, 114, 114),
                        actions: [
                          TextButton(
                            onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                            child: const Text('Tutup'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Verifikasi menggunakan No HP",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}