import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Pertemuan4Page(),
    );
  }
}

class Pertemuan4Page extends StatelessWidget {
  const Pertemuan4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 4'),
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol Submit (Hijau)
            _buildCustomButton(
              text: 'Submit',
              color: Colors.green,
              icon: Icons.check_circle_outline,
              onPressed: () => _showSnackBar(context, 'Berhasil Disubmit!'),
            ),
            const SizedBox(height: 20),
            
            // Tombol Delete (Merah)
            _buildCustomButton(
              text: 'Delete',
              color: Colors.redAccent,
              icon: Icons.delete_outline,
              onPressed: () => _showSnackBar(context, 'Data Dihapus!'),
            ),
            const SizedBox(height: 20),
            
            // Tombol Show Dialog (Abu-abu)
            _buildCustomButton(
              text: 'Show Dialog',
              color: Colors.grey.shade700,
              icon: Icons.info_outline,
              onPressed: () => _showDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk tombol agar rapi
  Widget _buildCustomButton({
    required String text,
    required Color color,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 5,
      ),
    );
  }

  // Fungsi SnackBar
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );
  }

  // Fungsi Dialog
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Informasi"),
        content: const Text("Ini adalah dialog yang keren!"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK")),
        ],
      ),
    );
  }
}