import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String nama;
  final String nim;

  const EditProfilePage({
    super.key,
    required this.nama,
    required this.nim,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController namaController;
  late TextEditingController nimController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.nama);
    nimController = TextEditingController(text: widget.nim);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: namaController),
            TextField(controller: nimController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'nama': namaController.text,
                  'nim': nimController.text,
                });
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}