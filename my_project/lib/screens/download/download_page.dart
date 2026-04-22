import 'package:flutter/material.dart';
import 'package:my_project/screens/download/model/download_card.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0F2C),

      body: SafeArea(
        child: Column(
          children: [

            // 🔹 TOP BAR
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back,
                      color: Colors.white),

                  const Spacer(),

                  const Text(
                    "Download",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),

                  const Spacer(),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // 🔻 LIST
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: const [

                  // ⏸ DOWNLOADING ITEM
                  DownloadCard(
                    image: "assets/images/spiderman.png",
                    title: "Spider-Man No Way Home",
                    progress: 0.75,
                    sizeText: "1.25 of 1.78 GB",
                    isDownloading: true,
                  ),

                  SizedBox(height: 20),

                  // ✅ DOWNLOADED ITEM
                  DownloadCard(
                    image: "assets/images/spiderman.png",
                    title: "Spider-Man No Way Home",
                    progress: 1.0,
                    sizeText: "Movie | 1.78 GB",
                    isDownloading: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // 🔻 BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0D0F2C),
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.download), label: "Download"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}