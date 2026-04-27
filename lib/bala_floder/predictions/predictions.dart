import 'package:flutter/material.dart';

import '../appbar/appbar.dart';
import '../color/color.dart';

class Predictions extends StatefulWidget {
  const Predictions({super.key});

  @override
  State<Predictions> createState() => _PredictionsState();
}

class _PredictionsState extends State<Predictions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Appbars(
          title: 'Predictions',
          enableBack: true,
          enableCoins: true,
          enableLogo: false,
          enableInfo: false,
          enableNotification: false,
          enableSearch: false,
          enableSettings: false,
          coins: 100,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.flash_on_outlined,
                    color: Colors.greenAccent,
                    size: 28,
                  ),
                  Text(
                    "Active Matches",
                    style: TextStyle(
                      color: light,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        right: 6,
                        top: 3,
                        bottom: 3,
                      ),
                      child: Text(
                        "3 LIVE",
                        style: TextStyle(
                          color: dark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              MatchCard(
                league: "INDIAN PREMIER LEAGUE",
                title: "Match Day Prediction",
                coins: 50,
                team1Name: "Mumbai Indians",
                team1Logo:
                    "https://image.crictracker.com/wp-content/uploads/2022/02/Mumbai-Indians-1.jpg",
                team2Name: "Chennai Super Kings",
                team2Logo:
                    "https://1000logos.net/wp-content/uploads/2024/03/Chennai-Super-Kings-Emblem.png",
              ),
              SizedBox(height: 10),
              MatchCard(
                league: "WORLD CUP 2026",
                title: "Match Day Prediction",
                coins: 100,
                team1Name: "Australia",
                team1Logo:
                    "https://tse4.mm.bing.net/th/id/OIP.F_k82J2A11ldMxGwQZ85kwHaKO?rs=1&pid=ImgDetMain&o=7&rm=3",
                team2Name: "England",
                team2Logo:
                    "https://tse3.mm.bing.net/th/id/OIP.MV14pFkG4PUzki-0ybQIIQHaHB?rs=1&pid=ImgDetMain&o=7&rm=3",
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.history, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    "Recent History",
                    style: TextStyle(
                      color: light,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              history(
                isCorrect: true,
                teams: "India VS Pakistan",
                picked: "India",
                coins: "100",
              ),
              SizedBox(height: 10),
              history(
                isCorrect: false,
                teams: "RCB VS KKR",
                picked: "RCB",
                coins: "50",
              ),
              SizedBox(height: 10),
              history(
                isCorrect: true,
                teams: "South Africa vs NZ",
                picked: "NZ",
                coins: "100",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget history({
  required bool isCorrect,
  required String teams,
  required String picked,
  required String coins,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.grey.withValues(alpha: 0.15),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.grey.withValues(alpha: 0.14)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          isCorrect
              ? Icon(Icons.check_circle_outline, color: light)
              : Icon(Icons.info_outline, color: Colors.red),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                teams,
                style: TextStyle(
                  color: light,
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                ),
              ),
              Text(
                "Picked: $picked",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              isCorrect
                  ? Text(
                      "+$coins",
                      style: TextStyle(
                        color: light,
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    )
                  : Text(
                      "-$coins",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ),
              Text(
                "COINS",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class MatchCard extends StatefulWidget {
  final String league;
  final String title;
  final int coins;

  final String team1Name;
  final String team1Logo;

  final String team2Name;
  final String team2Logo;

  const MatchCard({
    super.key,
    required this.league,
    required this.title,
    required this.coins,
    required this.team1Name,
    required this.team1Logo,
    required this.team2Name,
    required this.team2Logo,
  });

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  String? selectedTeam;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.grey.shade900, Colors.grey.shade800],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.league,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: light,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Spacer(),

              /// COIN CHIP
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.monetization_on,
                      color: Colors.amber,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.coins.toString(),
                      style: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: _teamCard(
                  widget.team1Name,
                  widget.team1Logo,
                  dark,
                  isSelected: selectedTeam == widget.team1Name,
                  onTap: () {
                    setState(() {
                      selectedTeam = widget.team1Name;
                    });
                  },
                ),
              ),

              /// VS
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text("VS", style: TextStyle(color: Colors.grey)),
              ),

              Expanded(
                child: _teamCard(
                  widget.team2Name,
                  widget.team2Logo,
                  dark,
                  isSelected: selectedTeam == widget.team2Name,
                  onTap: () {
                    setState(() {
                      selectedTeam = widget.team2Name;
                    });
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// BUTTON
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedTeam != null
                  ? Colors.green
                  : Colors.grey.shade700,
              fixedSize: const Size(double.infinity, 45),
            ),
            onPressed: selectedTeam == null ? null : () {},
            child: Text(
              selectedTeam == null
                  ? "Select a Team"
                  : "Continue with $selectedTeam",
              style: TextStyle(
                color: selectedTeam != null ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _teamCard(
    String name,
    String logo,
    Color bg, {
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.withValues(alpha: 0.15) : bg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.white10,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            CircleAvatar(radius: 26, backgroundImage: NetworkImage(logo)),
            const SizedBox(height: 8),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.greenAccent : Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
