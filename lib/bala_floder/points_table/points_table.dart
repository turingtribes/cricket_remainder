import 'package:flutter/material.dart';

import '../appbar/appbar.dart';
import '../color/color.dart';

class PointsTablePage extends StatelessWidget {
  const PointsTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Appbars(
          title: 'Points Table',
          enableBack: false,
          enableCoins: false,
          enableLogo: true,
          enableInfo: true,
          enableNotification: false,
          enableSearch: true,
          enableSettings: false,
          coins: 100,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const TableHeader(),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  TeamRow(
                    position: 1,
                    teamName: "Mumbai Indians",
                    logo:
                        "https://image.crictracker.com/wp-content/uploads/2022/02/Mumbai-Indians-1.jpg",
                    played: 10,
                    wins: 7,
                    loss: 3,
                    points: 14,
                    nrr: "+0.85",
                    isTop: true,
                  ),
                  TeamRow(
                    position: 2,
                    teamName: "Chennai Super Kings",
                    logo:
                        "https://1000logos.net/wp-content/uploads/2024/03/Chennai-Super-Kings-Emblem.png",
                    played: 10,
                    wins: 6,
                    loss: 4,
                    points: 12,
                    nrr: "+0.55",
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

class TableHeader extends StatelessWidget {
  const TableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade900,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("#", style: _headerStyle),
          Text("Team", style: _headerStyle),
          Text("P", style: _headerStyle),
          Text("W", style: _headerStyle),
          Text("L", style: _headerStyle),
          Text("Pts", style: _headerStyle),
          Text("NRR", style: _headerStyle),
        ],
      ),
    );
  }
}

const _headerStyle = TextStyle(color: Colors.grey, fontWeight: FontWeight.bold);

class TeamRow extends StatelessWidget {
  final int position;
  final String teamName;
  final String logo;
  final int played;
  final int wins;
  final int loss;
  final int points;
  final String nrr;
  final bool isTop;

  const TeamRow({
    super.key,
    required this.position,
    required this.teamName,
    required this.logo,
    required this.played,
    required this.wins,
    required this.loss,
    required this.points,
    required this.nrr,
    this.isTop = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: isTop ? Colors.green.withOpacity(0.15) : Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isTop ? Colors.green : Colors.white10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("$position", style: _cellStyle),

          Row(
            children: [
              CircleAvatar(radius: 12, backgroundImage: NetworkImage(logo)),
              const SizedBox(width: 6),
              SizedBox(
                width: 90,
                child: Text(
                  teamName,
                  overflow: TextOverflow.ellipsis,
                  style: _cellStyle,
                ),
              ),
            ],
          ),

          Text("$played", style: _cellStyle),
          Text("$wins", style: _cellStyle),
          Text("$loss", style: _cellStyle),
          Text("$points", style: _cellStyle),

          Text(
            nrr,
            style: TextStyle(
              color: nrr.startsWith('+') ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

const _cellStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w500);
