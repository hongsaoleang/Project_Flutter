import 'package:flutter/material.dart';

class MostPopularScreen extends StatelessWidget {
  const MostPopularScreen({super.key});

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
                    "Most Popular Movie",
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

                  PopularMovieItem(
                    image: "assets/images/spiderman.png",
                    title: "Spider-Man No Way Home",
                    tag: "Premium",
                    isFree: false,
                  ),

                  SizedBox(height: 20),

                  PopularMovieItem(
                    image: "assets/images/naruto.png",
                    title: "Riverdale",
                    tag: "Free",
                    isFree: true,
                  ),

                  SizedBox(height: 20),

                  PopularMovieItem(
                    image: "assets/images/lifeofpi.png",
                    title: "Life of PI",
                    tag: "Premium",
                    isFree: false,
                  ),

                  SizedBox(height: 20),

                  PopularMovieItem(
                    image: "assets/images/ninjago.png",
                    title: "Movie Dotcase",
                    tag: "Premium",
                    isFree: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class PopularMovieItem extends StatelessWidget {
  final String image;
  final String title;
  final String tag;
  final bool isFree;

  const PopularMovieItem({
    super.key,
    required this.image,
    required this.title,
    required this.tag,
    required this.isFree,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        // 🎞 POSTER + RATING
        Stack(
          children: [
            Container(
              width: 100,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.star,
                        color: Colors.orange, size: 14),
                    SizedBox(width: 3),
                    Text("4.5",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12)),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(width: 15),

        // 📄 INFO
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🏷 TAG
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isFree ? Colors.cyan : Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 12),
                ),
              ),

              const SizedBox(height: 10),

              // 🎬 TITLE
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // 📅 YEAR
              const Row(
                children: [
                  Icon(Icons.calendar_today,
                      color: Colors.grey, size: 14),
                  SizedBox(width: 5),
                  Text("2021",
                      style: TextStyle(color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 5),

              // ⏱ DURATION + PG
              Row(
                children: [
                  const Icon(Icons.access_time,
                      color: Colors.grey, size: 14),
                  const SizedBox(width: 5),
                  const Text("148 Minutes",
                      style: TextStyle(color: Colors.grey)),

                  const SizedBox(width: 10),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.cyan),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "PG-13",
                      style: TextStyle(
                          color: Colors.cyan, fontSize: 12),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              const Text(
                "Action | Movie",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }
}