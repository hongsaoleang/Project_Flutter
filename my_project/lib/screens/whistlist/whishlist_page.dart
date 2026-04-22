import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

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
                    "Wishlist",
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
                  WishlistCard(),
                  SizedBox(height: 20),
                  WishlistCard(),
                  SizedBox(height: 20),
                  WishlistCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1F3A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [

          // 🎞 IMAGE + PLAY BUTTON
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 100,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage(
                        "assets/images/spiderman.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // ▶ PLAY OVERLAY
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

          const SizedBox(width: 15),

          // 📄 INFO
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: const [

                Text("Action",
                    style: TextStyle(color: Colors.grey)),

                SizedBox(height: 5),

                Text(
                  "Spider-Man No Way Home",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 5),

                Row(
                  children: [
                    Text("Movie",
                        style:
                            TextStyle(color: Colors.grey)),

                    SizedBox(width: 10),

                    Icon(Icons.star,
                        color: Colors.orange, size: 16),

                    SizedBox(width: 5),

                    Text("4.5",
                        style:
                            TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),

          // ❤️ FAVORITE ICON
          const Icon(Icons.favorite, color: Colors.red),
        ],
      ),
    );
  }
}