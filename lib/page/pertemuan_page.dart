import 'package:flutter/material.dart';
import '../widgets/animation_popup.dart';

class PertemuanPage extends StatelessWidget {
  const PertemuanPage({super.key});

  final List<String> pertemuan = const [
    "P1",
    "P2",
    "P3",
    "P4",
    "P5",
    "P6",
    "P7",
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
      // ✅ APPBAR BENAR POSISINYA
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
      ),
      body: Stack(
        children: [
          // 🔥 BACKGROUND
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔥 SWIPE CARD
          Center(
            child: SizedBox(
              height: 220,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.7),
                itemCount: pertemuan.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      AnimatedPopup.show(
                        context,
                        title: pertemuan[index],
                        content: keterangan[index],
                      );
                    },

                    // 🔥 CARD
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 15),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 6,
                            color: Colors.black26,
                            offset: Offset(0, 4),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.book,
                              color: Colors.blue, size: 35),
                          const SizedBox(height: 12),

                          // 🔥 TEXT DENGAN FONT ORBITRON
                          Text(
                            pertemuan[index],
                            style: const TextStyle(
                              fontFamily: 'Orbitron',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: Colors.blue,
                              shadows: [
                                Shadow(
                                  blurRadius: 8,
                                  color: Colors.blue,
                                  offset: Offset(0, 0),
                                )
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