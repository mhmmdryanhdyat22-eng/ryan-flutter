import 'package:flutter/material.dart';
import 'page/profile_page.dart';
import 'page/pertemuan_page.dart';
import 'page/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.3),
          // Menggunakan Stack untuk mengatur posisi elemen secara bebas
          child: Stack(
            children: [
              // 1. Title di tengah layar
              // 1. Title di pojok kiri atas
Positioned(
  top: 50,   // Jarak dari atas layar (sesuaikan agar tidak tertutup status bar/baterai)
  left: 20,  // Jarak dari kiri layar
  child: const Text(
    "MOBILE PROGRAMMING",
    style: TextStyle(
      fontFamily: 'Orbitron',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      color: Colors.white, // Jangan lupa warna teks agar kontras dengan background
    ),
  ),
),

              // 2. Tombol di posisi kanan layar
              Positioned(
                top: 0,
                bottom: 0,
                right: 20, // Jarak dari sisi kanan
                child: Center(
                  child: SizedBox(
                    width: 200, // Atur lebar tombol agar tidak terlalu lebar
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildMenuButton(context, "Profile", const ProfilePage()),
                        const SizedBox(height: 12),
                        _buildMenuButton(context, "Pertemuan", PertemuanPage()),
                        const SizedBox(height: 12),
                        _buildMenuButton(context, "List Page", ListPage()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String text, Widget page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        backgroundColor: Colors.white.withOpacity(0.9),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}