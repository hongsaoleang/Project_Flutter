import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerScreen extends StatefulWidget {
  const TrailerScreen({super.key});

  @override
  State<TrailerScreen> createState() => _TrailerScreenState();
}

class _TrailerScreenState extends State<TrailerScreen> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(
            "https://www.youtube.com/watch?v=mqqft2x_Aa4",
          ) ??
          "",
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0F2C),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 TOP BAR
              Row(
                children: const [
                  Icon(Icons.arrow_back, color: Colors.white),
                  Spacer(),
                  Text(
                    "Trailer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.favorite, color: Colors.red),
                ],
              ),

              const SizedBox(height: 20),

              // 🎬 YOUTUBE PLAYER
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: YoutubePlayer(
                  controller: controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.cyan,
                ),
              ),

              const SizedBox(height: 15),

              // 🎬 TITLE
              const Text(
                "The Batman",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.grey, size: 14),
                  SizedBox(width: 5),
                  Text(
                    "Release Date: March 2, 2022",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 10),
                  Text("|", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 10),
                  Icon(Icons.movie, color: Colors.grey, size: 14),
                  SizedBox(width: 5),
                  Text("Action", style: TextStyle(color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Synopsis",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "THE BATMAN is an edgy, action-packed thriller...",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // 👥 CAST & CREW
              const Text(
                "Cast and Crew",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CastItem(
                      image: "assets/images/profile.png",
                      name: "Matt Reeves",
                      role: "Directors",
                    ),
                    SizedBox(width: 15),
                    CastItem(
                      image: "assets/images/profile.png",
                      name: "Matt Reeves",
                      role: "Writers",
                    ),
                    SizedBox(width: 15),
                    CastItem(
                      image: "assets/images/profile.png",
                      name: "Matt Reeves",
                      role: "Actors",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🖼 GALLERY
              const Text(
                "Galery",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    GalleryItem("assets/images/spiderman.png"),
                    SizedBox(width: 10),
                    GalleryItem("assets/images/spiderman.png"),
                    SizedBox(width: 10),
                    GalleryItem("assets/images/spiderman.png"),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    GalleryItem("assets/images/spiderman.png"),
                    SizedBox(width: 10),
                    GalleryItem("assets/images/spiderman.png"),
                    SizedBox(width: 10),
                    GalleryItem("assets/images/spiderman.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CastItem extends StatelessWidget {
  final String image;
  final String name;
  final String role;

  const CastItem({
    super.key,
    required this.image,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(backgroundImage: AssetImage(image), radius: 20),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(color: Colors.white)),
            Text(role, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

class GalleryItem extends StatelessWidget {
  final String image;

  const GalleryItem(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(image, width: 120, fit: BoxFit.cover),
    );
  }
}
