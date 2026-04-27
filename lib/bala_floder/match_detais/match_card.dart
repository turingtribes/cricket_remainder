import 'package:flutter/material.dart';

import '../color/color.dart';

Widget matchCard() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey.shade900,

      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.4),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
      border: Border(bottom: BorderSide(color: Colors.grey.shade800, width: 1)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// LEFT TEAM
          Column(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: Colors.grey.shade800,
                child: const CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(
                    'https://vectorseek.com/wp-content/uploads/2023/08/India-Cricket-Team-Logo-Vector.png',
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'IND',
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),

          /// CENTER SECTION
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// MATCH STATUS
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.green.withValues(alpha: 0.4),
                    ),
                  ),
                  child: const Text(
                    'MATCH ENDED',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// SCORE ROW
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '348/6',
                        style: TextStyle(
                          color: light,
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                          letterSpacing: 1,
                        ),
                      ),

                      const SizedBox(width: 6),

                      Transform.translate(
                        offset: const Offset(0, 6),
                        child: Text(
                          'vs',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      const SizedBox(width: 6),

                      Text(
                        '348/6',
                        style: TextStyle(
                          color: light,
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                /// RESULT TEXT
                Text(
                  'India won by 36 runs',
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          /// RIGHT TEAM
          Column(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: Colors.grey.shade800,
                child: const CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage('https://city-png.b-cdn.net/preview/preview_public/uploads/preview/australia-sport-cricket-team-logo-hd-transparent-png-701751712502591qatlzstlo8.png'),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'AUS',
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
