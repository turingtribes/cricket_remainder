import 'package:flutter/material.dart';

import '../../color/color.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          matchMomentumCard(),
          SizedBox(height: 20),
          manOfTheMatch(context),
          SizedBox(height: 20),
          venue(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

Widget matchMomentumCard() {
  final data = [40, 70, 30, 95, 45, 100, 60, 80, 55, 110];
  final maxVal = data.reduce((a, b) => a > b ? a : b);

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.grey.withValues(alpha: 0.15),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.grey.withValues(alpha: 0.4)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// HEADER
        Row(
          children: [
            const Icon(Icons.show_chart, color: Color(0xFF22C55E), size: 19),
            const SizedBox(width: 6),
            const Text(
              "Match Momentum",
              style: TextStyle(
                color: light,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white12),
              ),
              child: const Text(
                "Session 3",
                style: TextStyle(
                  color: light,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        /// GRAPH (FIXED)
        Center(
          child: SizedBox(
            height: 120,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(data.length, (index) {
                  final isGreen = index.isEven;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                    ), // 🔥 key
                    child: _bar(
                      height: (data[index] / maxVal) * 110,
                      color: isGreen
                          ? const Color(0xFF22C55E)
                          : const Color(0xFF1E3A8A),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        /// FOOTER
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("0.1 OV", style: TextStyle(color: light, fontSize: 13)),
            Text("50.0 OV", style: TextStyle(color: light, fontSize: 13)),
          ],
        ),
      ],
    ),
  );
}

/// BAR
Widget _bar({required double height, required Color color}) {
  return Container(
    width: 25,
    height: height,
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(6),
        topRight: Radius.circular(6),
      ),
    ),
  );
}

Widget manOfTheMatch(BuildContext context) {
  return Container(
    width: MediaQuery.sizeOf(context).width,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.green.withValues(alpha: 0.6),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.green.withValues(alpha: 0.4)),
    ),
    child: Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      Icons.emoji_events_outlined, // trophy
                      color: Colors.amber,
                      size: 28,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Man of the Match",
                      style: TextStyle(
                        color: dark,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 10, bottom: 2),
                  child: Text(
                    "Virat Kohli",
                    style: TextStyle(
                      color: light,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "112 Runs (94 balls) • 12 Fours ",
                    style: TextStyle(
                      color: dark,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 15, bottom: 20),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                          // border: Border.all(color: Colors.white12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: const Text(
                            "94.2% Rating",
                            style: TextStyle(
                              color: dark,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                          // border: Border.all(color: Colors.white12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: const Text(
                            "MVP Points: 420",
                            style: TextStyle(
                              color: dark,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 10),
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.grey.shade800,
                child: const CircleAvatar(
                  radius: 42,
                  backgroundImage: NetworkImage(
                    'https://tse4.mm.bing.net/th/id/OIP.BmlRgH-j4s5ow5_hItQ2_AHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget venue() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.grey.shade900,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.grey.withValues(alpha: 0.4)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Row(
          children: [
            Icon(
              Icons.info_outline, // trophy
              color: Colors.blue.shade600,
              size: 28,
            ),
            SizedBox(width: 5),
            Text(
              "Venue Information",
              style: TextStyle(
                color: light,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 10, bottom: 20),
          child: Table(
            children: [
              TableRow(
                decoration: BoxDecoration(),
                children: [
                  TableCell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "STADIUM",
                          style: TextStyle(
                            color: light.withValues(alpha: 0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Wankhede Stadium",
                          style: TextStyle(
                            color: light,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TableCell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CITY",
                          style: TextStyle(
                            color: light.withValues(alpha: 0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Mumbai, India",
                          style: TextStyle(
                            color: light,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(),
                children: [
                  TableCell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " ",
                          style: TextStyle(
                            color: light.withValues(alpha: 0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TableCell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " ",
                          style: TextStyle(
                            color: light.withValues(alpha: 0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              TableRow(
                children: [
                  TableCell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ATTENDANCE",
                          style: TextStyle(
                            color: light.withValues(alpha: 0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "33,108",
                          style: TextStyle(
                            color: light,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TableCell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TOSS",
                          style: TextStyle(
                            color: light.withValues(alpha: 0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "India, elected to bat",
                          style: TextStyle(
                            color: light,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
