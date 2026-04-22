import 'package:flutter/material.dart';

class DownloadCard extends StatelessWidget {
  final String image;
  final String title;
  final double progress;
  final String sizeText;
  final bool isDownloading;

  const DownloadCard({
    super.key,
    required this.image,
    required this.title,
    required this.progress,
    required this.sizeText,
    required this.isDownloading,
  });

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

          // 🎞 IMAGE + OVERLAY
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 100,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              if (isDownloading)
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.white, width: 3),
                  ),
                  child: const Center(
                    child: Icon(Icons.pause,
                        color: Colors.white),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 15),

          // 📄 INFO
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                const Text("Action",
                    style: TextStyle(color: Colors.grey)),

                const SizedBox(height: 5),

                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                Text(
                  sizeText,
                  style: const TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 5),

                // 🔻 PROGRESS BAR
                if (isDownloading)
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.cyan,
                  ),

                if (isDownloading)
                  Text(
                    "${(progress * 100).toInt()}%",
                    style:
                        const TextStyle(color: Colors.grey),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}