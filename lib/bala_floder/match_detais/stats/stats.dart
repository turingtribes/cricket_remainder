import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  /// 🔹 Head to Head Section
  Widget headToHead() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Head-to-head record",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          /// Numbers Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                children: [
                  Text(
                    "India",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Drawn",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "0",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Australia",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Progress Bar
          Stack(
            children: [
              Container(
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.66, // India wins ratio (2 out of 3)
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              /// White indicator
              Positioned(
                left:
                    MediaQueryData.fromView(
                      WidgetsBinding.instance.window,
                    ).size.width *
                    0.6,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 🔹 Match Item
  Widget matchItem({
    required String team1,
    required String team1Score,
    required String team2,
    required String team2Score,
    required String result,
    required String date,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Teams & Scores
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(team1, style: const TextStyle(color: Colors.white)),
              Text(team1Score, style: const TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(team2, style: const TextStyle(color: Colors.white)),
              Text(team2Score, style: const TextStyle(color: Colors.white)),
            ],
          ),

          const SizedBox(height: 8),

          /// Result + Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                result,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text(
                date,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          /// 🔥 Head to Head
          headToHead(),

          const SizedBox(height: 12),

          /// 🔥 Match List
          matchItem(
            team1: "India",
            team1Score: "271/5(20)",
            team2: "Australia",
            team2Score: "225(19.4)",
            result: "IND win by 46 runs",
            date: "31 Jan",
          ),
          matchItem(
            team1: "India",
            team1Score: "271/5(20)",
            team2: "Australia",
            team2Score: "225(19.4)",
            result: "IND win by 46 runs",
            date: "31 Jan",
          ),
          matchItem(
            team1: "India",
            team1Score: "271/5(20)",
            team2: "Australia",
            team2Score: "227/5(19.4)",
            result: "Aus win by 5 wickets",
            date: "31 Jan",
          ),
        ],
      ),
    );
  }
}
