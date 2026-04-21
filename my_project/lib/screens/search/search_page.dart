import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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

              // 🔍 SEARCH BAR
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1F3A),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      "Type title, categories, years, etc",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 CATEGORIES
              Row(
                children: [
                  category("All", true),
                  category("Comedy", false),
                  category("Animation", false),
                  category("Document", false),
                ],
              ),

              const SizedBox(height: 25),

              // 🔹 TODAY TITLE
              const Text(
                "Today",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              // 🔹 FEATURE MOVIE
              Row(
                children: [
                  // Poster
                  Container(
                    width: 110,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image:
                            AssetImage("assets/images/spiderman.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "⭐ 4.5",
                          style: TextStyle(
                              color: Colors.orange, fontSize: 12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        // Premium tag
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius:
                                BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Premium",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Spider-Man No Way Home",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 10),

                        const Row(
                          children: [
                            Icon(Icons.calendar_today,
                                color: Colors.grey, size: 14),
                            SizedBox(width: 5),
                            Text("2021",
                                style:
                                    TextStyle(color: Colors.grey)),
                          ],
                        ),

                        const SizedBox(height: 5),

                        const Row(
                          children: [
                            Icon(Icons.access_time,
                                color: Colors.grey, size: 14),
                            SizedBox(width: 5),
                            Text("148 Minutes",
                                style:
                                    TextStyle(color: Colors.grey)),
                          ],
                        ),

                        const SizedBox(height: 5),

                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.cyan),
                                borderRadius:
                                    BorderRadius.circular(5),
                              ),
                              child: const Text(
                                "PG-13",
                                style: TextStyle(
                                    color: Colors.cyan,
                                    fontSize: 12),
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
              ),

              const SizedBox(height: 30),

              // 🔹 RECOMMEND TITLE
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recommend for you",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("See All",
                      style: TextStyle(color: Colors.cyan)),
                ],
              ),

              const SizedBox(height: 15),

              // 🔹 HORIZONTAL LIST
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    movieCard("assets/images/ninjago.png",
                        "The Jungle Wa.."),
                    movieCard(
                        "assets/images/naruto.png", "Life of PI"),
                    movieCard("assets/images/lifeofpi.png", "DOT.."),
                  ],
                ),
              ),
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    movieCard("assets/images/ninjago.png",
                        "The Jungle Wa.."),
                    movieCard(
                        "assets/images/naruto.png", "Life of PI"),
                    movieCard("assets/images/lifeofpi.png", "DOT.."),
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
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.download), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  // 🔹 CATEGORY
  Widget category(String text, bool active) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: active
              ? const Color(0xFF1C1F3A)
              : Colors.transparent,
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
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 160,
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
          Text(title,
              style: const TextStyle(color: Colors.white)),
          const Text("Action",
              style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}