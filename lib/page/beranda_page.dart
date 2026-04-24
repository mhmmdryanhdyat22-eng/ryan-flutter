import 'dart:ui'; // WAJIB untuk efek Blur
import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'pertemuan_page.dart';
import 'list_page.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. BACKGROUND IMAGE FULL LAYAR
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/beranda.jpg'), 
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. MENU DI SEBELAH KANAN DENGAN EFEK TRANSPARAN
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Efek kaca buram
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2), // Transparansi 20%
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Ukuran kotak mengikuti isi
                      children: [
                        const Text(
                          "MENU",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildMenuButton(
                          context, 
                          "Profile", 
                          Icons.person, 
                          const ProfilePage()
                        ),
                        const SizedBox(height: 15),
                        _buildMenuButton(
                          context, 
                          "Pertemuan", 
                          Icons.book, 
                          const PertemuanPage()
                        ),
                        const SizedBox(height: 15),
                        _buildMenuButton(
                          context, 
                          "ListView", 
                          Icons.list, 
                          ListPage()
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi Helper untuk membuat tombol yang seragam
  Widget _buildMenuButton(BuildContext context, String label, IconData icon, Widget targetPage) {
    return SizedBox(
      width: 140, // Lebar tombol disesuaikan
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.8), // Tombol putih semi-transparan
          foregroundColor: Colors.indigo, // Warna ikon dan teks
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
        ),
        icon: Icon(icon, size: 20),
        label: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetPage),
          );
        },
      ),
    );
  }
}