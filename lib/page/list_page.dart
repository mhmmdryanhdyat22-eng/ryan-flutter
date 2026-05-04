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

  // Tambahkan deskripsi untuk setiap pertemuan
  final List<String> materi = [
    "Pengenalan Android dan Flutter",
    "Widget dan button",
    "Activity dan intent",
    "Toast dan alert dialog",
    "Listview dan cardview",
    "Checkbox dan switch",
    "Radio button dan dropdown",
  ];

  ListPage({super.key});

  void _showPopup(BuildContext context, String pertemuan, String materi) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(pertemuan),
          content: Text(materi),
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/live.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            itemCount: data.length,
            separatorBuilder: (context, index) =>
                const Divider(color: Colors.white24),
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white.withOpacity(0.1),
                child: ListTile(
                  leading: const Icon(Icons.book, color: Colors.white),
                  title: Text(
                    data[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                  onTap: () {
                    _showPopup(
                      context,
                      data[index],
                      materi[index], // ini yang penting
                    );
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