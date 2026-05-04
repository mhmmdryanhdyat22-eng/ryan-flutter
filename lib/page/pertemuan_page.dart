import 'package:flutter/material.dart';
import '../widgets/animation_popup.dart';
import 'pertemuan6.dart';
import 'pertemuan7.dart';
import 'pertemuan4.dart';

class PertemuanPage extends StatelessWidget {
  const PertemuanPage({super.key});

  final List<String> pertemuan = const [
    "P1", "P2", "P3", "P4", "P5", "P6", "P7",
  ];

  final List<String> keterangan = const [
    "Pengenalan Android dan Flutter",
    "Widget dan button",
    "Activity dan intent",
    "Toast dan alert dialog",
    "Listview dan cardview",
    "Checkbox dan switch",
    "Radio button dan dropdown",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LEARNING JOURNEY GUIDE",
          style: TextStyle(
            fontFamily: 'Orbitron',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
      ),

      body: Stack(
        children: [
          // BACKGROUND
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // OVERLAY
          Container(color: Colors.black.withOpacity(0.2)),

          // CARD VIEW
          Center(
            child: SizedBox(
              height: 250,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.7),
                itemCount: pertemuan.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (pertemuan[index] == "P4") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Pertemuan4Page(),
                          ),
                        );
                      } else if (pertemuan[index] == "P6") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Pertemuan6Page(),
                          ),
                        );
                      } else if (pertemuan[index] == "P7") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Pertemuan7Page(),
                          ),
                        );
                      } else {
                        AnimatedPopup.show(
                          context,
                          title: "Materi ${pertemuan[index]}",
                          content: keterangan[index],
                        );
                      }
                    },

                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: Colors.blue.withOpacity(0.3), width: 2),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            color: Colors.blue.withOpacity(0.2),
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.bookmark,
                            color: Colors.blue,
                            size: 60,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            pertemuan[index],
                            style: const TextStyle(
                              fontFamily: 'Orbitron',
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              letterSpacing: 3,
                              shadows: [
                                Shadow(
                                  blurRadius: 12.0,
                                  color: Colors.blue,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}