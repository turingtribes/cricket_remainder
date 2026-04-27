import 'package:cricket_remainder/bala_floder/color/color.dart';
import 'package:cricket_remainder/bala_floder/match_detais/graph/graph.dart';
import 'package:cricket_remainder/bala_floder/match_detais/scorecard/scorecard.dart';
import 'package:cricket_remainder/bala_floder/match_detais/stats/stats.dart';
import 'package:flutter/material.dart';

import '../appbar/appbar.dart';
import './summary/summary.dart';
import 'match_card.dart';

class MatchCenter extends StatefulWidget {
  const MatchCenter({super.key});

  @override
  State<MatchCenter> createState() => _MatchCenterState();
}

class _MatchCenterState extends State<MatchCenter>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget tabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4), // ✅ fixed
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade800, width: 1),
        ),
      ),
      child: TabBar(
        controller: tabController,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(width: 3, color: Colors.green),
        ),
        labelColor: Colors.green,
        unselectedLabelColor: Colors.grey,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        tabs: const [
          Tab(text: 'Summary'),
          Tab(text: 'Scorecard'),
          Tab(text: 'Stats'),
          Tab(text: 'Graph'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Appbars(
          title: 'Match Center',
          enableBack: true,
          enableCoins: false,
          enableLogo: false,
          enableInfo: false,
          enableNotification: true,
          enableSearch: true,
          enableSettings: false,
        ),
      ),
      body: Column(
        children: [
          matchCard(),
          tabBar(),

          const SizedBox(height: 10),

          /// ✅ Tab Content
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [Summary(), Scorecard(), Stats(), Graph()],
            ),
          ),
        ],
      ),
    );
  }
}
