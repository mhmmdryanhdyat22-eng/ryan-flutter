import 'package:flutter/material.dart';

class Pertemuan7Page extends StatefulWidget {
  const Pertemuan7Page({super.key});

  @override
  State<Pertemuan7Page> createState() => _Pertemuan7PageState();
}

class _Pertemuan7PageState extends State<Pertemuan7Page>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _umurController = TextEditingController();

  String? _selectedGender;
  String?
  _selectedJob; // Diubah ke String untuk menyimpan 'value' dari list jobs
  String? _selectedWorkType;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<Map<String, dynamic>> jobs = [
    {
      'value': 'Admin',
      'icon': Icons.support_agent,
      'color': const Color(0xFF2196F3),
    },
    {
      'value': 'Manager',
      'icon': Icons.leaderboard,
      'color': const Color(0xFF4CAF50),
    },
    {
      'value': 'Programmer',
      'icon': Icons.code,
      'color': const Color(0xFFE91E63),
    },
  ];

  final List<Map<String, dynamic>> workTypeOptions = [
    {
      'value': 'Full Time',
      'subtitle': 'Bekerja 40 jam/minggu',
      'icon': Icons.work,
      'color': const Color(0xFF00B97B),
    },
    {
      'value': 'Part Time',
      'subtitle': 'Bekerja 20 jam/minggu',
      'icon': Icons.schedule,
      'color': const Color(0xFF0288D1),
    },
    {
      'value': 'Freelance',
      'subtitle': 'Per proyek',
      'icon': Icons.laptop,
      'color': const Color(0xFF673AB7),
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _namaController.dispose();
    _umurController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 7 - Form Lengkap"),
        backgroundColor: const Color(0xFF00695C),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    labelText: "Nama Lengkap",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _umurController,
                  decoration: const InputDecoration(
                    labelText: "Umur",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.cake),
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 20),
                const Text(
                  "Jenis Kelamin:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Laki-laki"),
                        value: "Laki-laki",
                        groupValue: _selectedGender,
                        onChanged: (val) =>
                            setState(() => _selectedGender = val),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Perempuan"),
                        value: "Perempuan",
                        groupValue: _selectedGender,
                        onChanged: (val) =>
                            setState(() => _selectedGender = val),
                      ),
                    ),
                  ],
                ),

                const Divider(),
                const Text(
                  "Pilih Pekerjaan:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // Radio Horizontal menggunakan Map
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: jobs.map((job) {
                    return Column(
                      children: [
                        Radio<String>(
                          value: job['value'],
                          groupValue: _selectedJob,
                          activeColor: job['color'],
                          onChanged: (val) =>
                              setState(() => _selectedJob = val),
                        ),
                        Icon(job['icon'], color: job['color']),
                        Text(job['value']),
                      ],
                    );
                  }).toList(),
                ),

                const Divider(),
                const Text(
                  "Tipe Kerja:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // RadioListTile Vertical dengan Subtitle
                ...workTypeOptions.map((type) {
                  return RadioListTile<String>(
                    title: Text(type['value']),
                    subtitle: Text(type['subtitle']),
                    secondary: Icon(type['icon'], color: type['color']),
                    value: type['value'],
                    groupValue: _selectedWorkType,
                    activeColor: type['color'],
                    onChanged: (val) => setState(() => _selectedWorkType = val),
                  );
                }).toList(),

                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00695C),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Konfirmasi Data"),
                            content: Text(
                              "Nama: ${_namaController.text}\n"
                              "Umur: ${_umurController.text}\n"
                              "Gender: ${_selectedGender ?? '-'}\n"
                              "Pekerjaan: ${_selectedJob ?? '-'}\n"
                              "Tipe: ${_selectedWorkType ?? '-'}",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("OK"),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "SIMPAN DATA",
                      style: TextStyle(color: Colors.white),
                    ),
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
