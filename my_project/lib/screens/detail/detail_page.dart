import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0F2C),

      body: Stack(
        children: [

          // 🔻 BACKGROUND IMAGE
          SizedBox(
            height: 350,
            width: double.infinity,
            child: Image.asset(
              "assets/images/spiderman.png",
              fit: BoxFit.cover,
            ),
          ),

          // 🔻 DARK OVERLAY
          Container(
            height: 350,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                  const Color(0xFF0D0F2C),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // 🔻 CONTENT
          SafeArea(
            child: Column(
              children: [

                // 🔹 TOP BAR
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back,
                          color: Colors.white),

                      const Spacer(),

                      const Text(
                        "Spider-Man No Way..",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),

                      const Spacer(),

                      const Icon(Icons.favorite,
                          color: Colors.red),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 POSTER
                Container(
                  height: 300,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage(
                          "assets/images/spiderman.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 INFO ROW
                const Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today,
                        color: Colors.grey, size: 14),
                    SizedBox(width: 5),
                    Text("2021",
                        style: TextStyle(color: Colors.grey)),

                    SizedBox(width: 10),
                    Text("|",
                        style: TextStyle(color: Colors.grey)),

                    SizedBox(width: 10),
                    Icon(Icons.access_time,
                        color: Colors.grey, size: 14),
                    SizedBox(width: 5),
                    Text("148 Minutes",
                        style: TextStyle(color: Colors.grey)),

                    SizedBox(width: 10),
                    Text("|",
                        style: TextStyle(color: Colors.grey)),

                    SizedBox(width: 10),
                    Icon(Icons.movie,
                        color: Colors.grey, size: 14),
                    SizedBox(width: 5),
                    Text("Action",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),

                const SizedBox(height: 15),

                // 🔹 RATING
                const Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.orange),
                    SizedBox(width: 5),
                    Text("4.5",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16)),
                  ],
                ),

                const SizedBox(height: 20),

                // 🔹 BUTTONS
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [

                    // ▶ PLAY
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius:
                            BorderRadius.circular(30),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.play_arrow,
                              color: Colors.white),
                          SizedBox(width: 5),
                          Text("Play",
                              style: TextStyle(
                                  color: Colors.white)),
                        ],
                      ),
                    ),

                    const SizedBox(width: 15),

                    // ⬇ DOWNLOAD
                    circleBtn(Icons.download, (){
                    }),

                    const SizedBox(width: 15),

                    // 🔗 SHARE
                    circleBtn(Icons.open_in_new, (){
                      showShareDialog(context);
                    })
                  ],
                ),

                const SizedBox(height: 30),

                // 🔹 STORY
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: const [

                        Text(
                          "Story Line",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),

                        SizedBox(height: 10),

                        Text(
                          "For the first time in the cinematic history of Spider-Man, our friendly neighborhood hero's identity is revealed...",
                          style: TextStyle(
                              color: Colors.grey,
                              height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // 🔻 BOTTOM NAV (OPTIONAL)
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0D0F2C),
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.download), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  // 🔹 CIRCLE BUTTON
  Widget circleBtn(IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1F3A),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.cyan),
    ),
  );
}
}
void showShareDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (_) {
      return Stack(
        children: [

          // 🔻 BLUR BACKGROUND
          Blur(
            blur: 10,
            blurColor: Colors.black.withOpacity(0.3),
            child: Container(),
          ),

          // 🔻 CENTER DIALOG
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1C1F3A),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // 🔹 CLOSE BUTTON
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black26,
                        child: Icon(Icons.close,
                            color: Colors.white, size: 18),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // 🔹 TITLE
                  const Text(
                    "Share to",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const Divider(color: Colors.grey),

                  const SizedBox(height: 15),

                  // 🔹 ICON ROW
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    children: [

                      socialBtn(Icons.facebook, Colors.blue),

                      socialBtn(Icons.camera_alt,
                          Colors.pink), // Instagram

                      socialBtn(Icons.message,
                          Colors.blueAccent), // Messenger

                      socialBtn(Icons.send,
                          Colors.cyan), // Telegram
                    ],
                  ),
                  const SizedBox(height: 20),

// 🎬 EPISODE TITLE
const Text(
  "Episode",
  style: TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 10),

// 🔽 SEASON DROPDOWN (STATIC UI)
Row(
  children: const [
    Text(
      "Season 2",
      style: TextStyle(color: Colors.white),
    ),
    SizedBox(width: 5),
    Icon(Icons.keyboard_arrow_down, color: Colors.white),
  ],
),

const SizedBox(height: 15),

// 🎞 EPISODE LIST
EpisodeCard(),
SizedBox(height: 15),
EpisodeCard(),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
Widget socialBtn(IconData icon, Color color) {
  return Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      color: color.withOpacity(0.2),
      shape: BoxShape.circle,
    ),
    child: Icon(icon, color: color),
  );
}
class EpisodeCard extends StatelessWidget {
  const EpisodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1F3A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              // 🎞 IMAGE + PLAY
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/movie3.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.play_arrow,
                        color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(width: 10),

              // 📄 INFO
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    // 🏷 TAG + DOWNLOAD
                    Row(
                      children: [

                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius:
                                BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Premium",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ),

                        const Spacer(),

                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xFF0D0F2C),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.download,
                              color: Colors.orange, size: 18),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      "1h30m",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const Text(
                      "Episode 1",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),

          const SizedBox(height: 10),

          // 📝 DESCRIPTION
          const Text(
            "Football player who longs to write his own music. It’s not all smiles for this hunk though after he gets involved with his music teacher.",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}