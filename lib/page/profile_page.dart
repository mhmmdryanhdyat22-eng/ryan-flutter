import 'dart:io';
import 'dart:ui'; // WAJIB: Untuk efek blur
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'edit_profile_page.dart'; // Pastikan file ini ada

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String nama = "Muhammad Ryan Hidayat";
  String nim = "241011701358";

  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    setState(() => _image = File(pickedFile.path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/photo.jpg'), // Pastikan file ada
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            // Glassmorphism Container
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2), 
                    border: Border.all(color: Colors.white.withOpacity(0.3)), 
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: pickImage,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: _image != null 
                              ? FileImage(_image!) as ImageProvider 
                              : const AssetImage('assets/profile.jpg'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(nama, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text("NIM: $nim", style: const TextStyle(fontSize: 16, color: Colors.white70)),
                      
                      const SizedBox(height: 30),
                      
                      // Stats Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem("Projek", "12"),
                          _buildStatItem("Pengikut", "11 JT"),
                          _buildStatItem("Pertemuan", "14"),
                        ],
                      ),
                      
                      const SizedBox(height: 30),
                      
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.3),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                          onPressed: () async {
                            // INTEGRASI EDIT PROFILE DI SINI
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EditProfilePage(nama: nama, nim: nim),
                              ),
                            );

                            // Jika ada data baru yang dikembalikan, update state
                            if (result != null && result is Map) {
                              setState(() {
                                nama = result['nama'] ?? nama;
                                nim = result['nim'] ?? nim;
                              });
                            }
                          },
                          child: const Text("EDIT PROFILE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        Text(label, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }
}