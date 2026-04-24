import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final List<String> data = [
    "Pertemuan 1",
    "Pertemuan 2",
    "Pertemuan 3",
    "Pertemuan 4",
    "Pertemuan 5",
    "Pertemuan 6",
    "Pertemuan 7",
  ];

  ListPage({super.key});

  // Fungsi untuk menampilkan pop-up
  void _showPopup(BuildContext context, String item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text("Informasi"),
          content: Text("Anda memilih $item"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Tutup"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menggunakan Stack/Container untuk background
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/live.jpg'), // Pastikan path benar
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.5), // Lapisan gelap agar teks terbaca
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            itemCount: data.length,
            separatorBuilder: (context, index) => const Divider(color: Colors.white24),
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white.withOpacity(0.1), // Transparansi card
                child: ListTile(
                  leading: const Icon(Icons.book, color: Colors.white),
                  title: Text(
                    data[index],
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
                  // Fitur Klik Pop-up
                  onTap: () {
                    _showPopup(context, data[index]);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}