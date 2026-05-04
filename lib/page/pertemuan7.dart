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
  final _lainnyaController = TextEditingController();

  String? _selectedGender;
  String? _selectedJob;
  String? _selectedWorkType;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<Map<String, dynamic>> jobs = [
    {'value': 'Admin', 'icon': Icons.support_agent, 'color': Color(0xFF2196F3)},
    {'value': 'Manager', 'icon': Icons.leaderboard, 'color': Color(0xFF4CAF50)},
    {'value': 'Programmer', 'icon': Icons.code, 'color': Color(0xFFE91E63)},
    {'value': 'Kuliah', 'icon': Icons.school, 'color': Color(0xFFFF9800)},
    {'value': 'Guru', 'icon': Icons.menu_book, 'color': Color(0xFF9C27B0)},
    {'value': 'Lain-lain', 'icon': Icons.edit, 'color': Color(0xFF607D8B)},
  ];

  final List<Map<String, dynamic>> workTypeOptions = [
    {
      'value': 'Full Time',
      'subtitle': 'Bekerja 40 jam/minggu',
      'icon': Icons.work,
      'color': Color(0xFF00B97B),
    },
    {
      'value': 'Part Time',
      'subtitle': 'Bekerja 20 jam/minggu',
      'icon': Icons.schedule,
      'color': Color(0xFF0288D1),
    },
    {
      'value': 'Freelance',
      'subtitle': 'Per proyek',
      'icon': Icons.laptop,
      'color': Color(0xFF673AB7),
    },
    {
      'value': 'Kontrak',
      'subtitle': 'Bekerja dengan kontrak',
      'icon': Icons.description,
      'color': Color(0xFFFF5722),
    },
  ];

  void _resetForm() {
    setState(() {
      _namaController.clear();
      _umurController.clear();
      _lainnyaController.clear();
      _selectedGender = null;
      _selectedJob = null;
      _selectedWorkType = null;
    });
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: Colors.red),
    );
  }

  void _showSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Data tersimpan"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _fadeAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _namaController.dispose();
    _umurController.dispose();
    _lainnyaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 7 - Form Lengkap"),
        backgroundColor: const Color(0xFF00695C),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _resetForm)
        ],
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
                // NAMA
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    labelText: "Nama Lengkap",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? "Nama wajib diisi" : null,
                ),
                const SizedBox(height: 15),

                // UMUR
                TextFormField(
                  controller: _umurController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Umur",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.cake),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Umur wajib diisi";
                    if (int.tryParse(v) == null) return "Umur harus angka";
                    return null;
                  },
                ),

                const SizedBox(height: 20),
                const Text("Jenis Kelamin:",
                    style: TextStyle(fontWeight: FontWeight.bold)),

                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Laki-laki"),
                        value: "Laki-laki",
                        groupValue: _selectedGender,
                        onChanged: (v) => setState(() => _selectedGender = v),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Perempuan"),
                        value: "Perempuan",
                        groupValue: _selectedGender,
                        onChanged: (v) => setState(() => _selectedGender = v),
                      ),
                    ),
                  ],
                ),

                const Divider(),
                const Text("Pilih Pekerjaan:",
                    style: TextStyle(fontWeight: FontWeight.bold)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: jobs.map((job) {
                    return Column(
                      children: [
                        Radio<String>(
                          value: job['value'],
                          groupValue: _selectedJob,
                          activeColor: job['color'],
                          onChanged: (v) => setState(() => _selectedJob = v),
                        ),
                        Icon(job['icon'], color: job['color']),
                        Text(job['value']),
                      ],
                    );
                  }).toList(),
                ),

                if (_selectedJob == "Lain-lain")
                  TextFormField(
                    controller: _lainnyaController,
                    decoration: const InputDecoration(
                      labelText: "Tulis pekerjaan",
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) {
                      if (_selectedJob == "Lain-lain" &&
                          (v == null || v.isEmpty)) {
                        return "Pekerjaan wajib diisi";
                      }
                      return null;
                    },
                  ),

                const Divider(),
                const Text("Tipe Kerja:",
                    style: TextStyle(fontWeight: FontWeight.bold)),

                ...workTypeOptions.map((type) {
                  return RadioListTile<String>(
                    title: Text(type['value']),
                    subtitle: Text(type['subtitle']),
                    secondary: Icon(type['icon'], color: type['color']),
                    value: type['value'],
                    groupValue: _selectedWorkType,
                    onChanged: (v) => setState(() => _selectedWorkType = v),
                  );
                }),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00695C),
                        ),
                        child: const Text("SIMPAN DATA"),
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) return;
                          if (_selectedGender == null) {
                            _showError("Pilih jenis kelamin");
                            return;
                          }
                          if (_selectedJob == null) {
                            _showError("Pilih pekerjaan");
                            return;
                          }
                          if (_selectedWorkType == null) {
                            _showError("Pilih tipe kerja");
                            return;
                          }

                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text("Konfirmasi Data"),
                              content: Text(
                                "Nama: ${_namaController.text}\n"
                                "Umur: ${_umurController.text}\n"
                                "Gender: $_selectedGender\n"
                                "Pekerjaan: ${_selectedJob == "Lain-lain"
                                    ? _lainnyaController.text
                                    : _selectedJob}\n"
                                "Tipe Kerja: $_selectedWorkType",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _showSuccess();
                                    _resetForm();
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _resetForm,
                        child: const Text("RESET"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}