import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  final List<String> bannerImages = [
    "assets/images/banner.png",
    "assets/images/spiderman.png",
    "assets/images/lifeofpi.png",
  ];

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

              // 🔹 HEADER
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage("assets/images/profile.png"),
                  ),
                  const SizedBox(width: 12),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hello, Smith",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Let's stream your favorite movie",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1F3A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.favorite, color: Colors.red),
                  )
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 SEARCH BAR
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1F3A),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text("Search a title..",
                        style: TextStyle(color: Colors.grey)),
                    Spacer(),
                    Icon(Icons.tune, color: Colors.grey),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 CAROUSEL SLIDER
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                items: bannerImages.map((image) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Colors.black54, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Black Panther: Wakanda Forever\nOn March 2, 2022",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 10),

              // 🔹 DOT INDICATOR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: bannerImages.asMap().entries.map((entry) {
                  return Container(
                    width: currentIndex == entry.key ? 20 : 6,
                    height: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: currentIndex == entry.key
                          ? Colors.cyan
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 25),

              // 🔹 CATEGORIES
              const Text("Categories",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),

              const SizedBox(height: 15),

              Row(
                children: [
                  category("All", true),
                  category("Comedy", false),
                  category("Animation", false),
                  category("Document", false),
                ],
              ),

              const SizedBox(height: 25),

              // 🔹 MOVIES TITLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Movies",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text("See All",
                      style: TextStyle(color: Colors.cyan)),
                ],
              ),

              const SizedBox(height: 15),

              // 🔹 MOVIE LIST
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    movieCard("assets/images/spider_man_gif.png", "Spider-Man"),
                    movieCard("assets/images/ninjago.png", "NinjaGO"),
                    movieCard("assets/images/naruto.png", "Naruto"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // 🔻 BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0D0F2C),
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.download), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  // 🔹 CATEGORY BUTTON
  Widget category(String text, bool active) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF1C1F3A) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: active ? Colors.cyan : Colors.grey,
          ),
        ),
      ),
    );
  }

  // 🔹 MOVIE CARD
  Widget movieCard(String image, String title) {
    return _HoverMovieCard(image : image, title : title);
  }
}

class _HoverMovieCard extends StatefulWidget {
  final String image;
  final String title;

  const _HoverMovieCard({
    required this.image,
    required this.title,
  });

  @override
  State<_HoverMovieCard> createState() => _HoverMovieCardState();
}

class _HoverMovieCardState extends State<_HoverMovieCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isHovered = true),
      onTapUp: (_) => setState(() => isHovered = false),
      onTapCancel: () => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()
          ..translate(0.0, isHovered ? -10.0 : 0.0)
          ..scale(isHovered ? 1.05 : 1.0),
        margin: const EdgeInsets.only(right: 12),
        width: 140,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🎬 Poster
            Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: isHovered
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            )
                          ]
                        : [],
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // ⭐ Rating
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "⭐ 4.5",
                      style: TextStyle(
                          color: Colors.orange, fontSize: 12),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 8),

            // 🎞 Title
            Text(
              widget.title,
              style: const TextStyle(color: Colors.white),
            ),

            const Text(
              "Action",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}