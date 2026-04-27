import 'package:cricket_remainder/bala_floder/color/color.dart';
import 'package:flutter/material.dart';

class Scorecard extends StatefulWidget {
  const Scorecard({super.key});

  @override
  State<Scorecard> createState() => _ScorecardState();
}

class _ScorecardState extends State<Scorecard>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  /// 🔹 Tabs
  Widget tabBar() {
    return Container(
      color: dark,
      child: TabBar(
        controller: tabController,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(width: 3, color: Colors.green),
        ),
        labelColor: Colors.green,
        unselectedLabelColor: Colors.grey,
        tabs: const [
          Tab(text: 'India'),
          Tab(text: 'Australia'),
        ],
      ),
    );
  }

  /// 🔹 Header (FIXED ALIGNMENT)
  Widget tableHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        children: const [
          SizedBox(width: 50), // avatar space

          Expanded(
            flex: 3,
            child: Text(
              'Batting',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text('R', style: TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Text('B', style: TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Text('4s', style: TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Text('6s', style: TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Text('S/R', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  /// 🔹 Player Row
  Widget playerCard({required String name, required String status}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: Row(
        children: [
          /// Avatar (same width as header spacing)
          const SizedBox(
            width: 50,
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                'https://tse4.mm.bing.net/th/id/OIP.BmlRgH-j4s5ow5_hItQ2_AHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
              ),
            ),
          ),

          /// Name + Status
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  status,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),

          /// Stats (aligned perfectly)
          const Expanded(
            child: Text('52', style: TextStyle(color: Colors.white)),
          ),
          const Expanded(
            child: Text('26', style: TextStyle(color: Colors.white)),
          ),
          const Expanded(
            child: Text('2', style: TextStyle(color: Colors.white)),
          ),
          const Expanded(
            child: Text('5', style: TextStyle(color: Colors.white)),
          ),
          const Expanded(
            child: Text('200.0', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget extrasSection() {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          /// Extras
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Extras", style: TextStyle(color: Colors.grey)),
              Text(
                "12 (W 7, B 4, LB 1)",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),

          /// Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total runs", style: TextStyle(color: Colors.grey)),
              Text(
                "159 (10 wkts, 19 ov)",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),

          SizedBox(height: 15),

          /// Fall of wickets
          Text(
            "Fall of wickets",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),

          Text(
            "31/1 (F. Allen, 2.4 ov) • 32/2 (R. Ravindra, 3.1 ov) • "
            "47/3 (G. Phillips, 4.5 ov) • 70/4 (M. Chapman, 7.4 ov) • "
            "72/5 (T. Seifert, 8.1 ov) • 124/6 (D. Mitchell, 12.5 ov) • "
            "141/7 (J. Neesham, 15.3 ov) • 141/8 (M. Henry, 15.4 ov) • "
            "152/9 (M. Santner, 17.3 ov) • 159/10 (J. Duffy, 18.6 ov)",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget bowlingHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: const [
          SizedBox(width: 50),
          Expanded(
            flex: 3,
            child: Text("Bowling", style: TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Text("O", style: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: Text("M", style: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: Text("R", style: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: Text("W", style: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: Text("Econ", style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  Widget bowlingRow({
    required String name,
    required String overs,
    required String maidens,
    required String runs,
    required String wickets,
    required String econ,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 50,
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                'https://tse4.mm.bing.net/th/id/OIP.BmlRgH-j4s5ow5_hItQ2_AHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Text(name, style: const TextStyle(color: Colors.white)),
          ),

          Expanded(
            child: Text(overs, style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Text(maidens, style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Text(runs, style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Text(wickets, style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Text(econ, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget keySection() {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Key",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text("C   Captain", style: TextStyle(color: Colors.grey)),
          Text("Wk  Wicket-keeper", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  /// 🔹 Team View
  Widget teamView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          tableHeader(),

          /// Batting
          playerCard(name: 'Abhishek', status: 'c Ishan b Varun'),
          playerCard(name: 'Abhishek', status: 'c Ishan b Varun'),
          playerCard(name: 'Abhishek', status: 'c Ishan b Varun'),
          playerCard(name: 'Abhishek', status: 'c Ishan b Varun'),
          playerCard(name: 'Abhishek', status: 'Not Out'),

          /// NEW SECTIONS 👇
          extrasSection(),

          bowlingHeader(),
          bowlingRow(
            name: "A. Singh",
            overs: "4.0",
            maidens: "0",
            runs: "32",
            wickets: "0",
            econ: "8.00",
          ),
          bowlingRow(
            name: "H. Pandya",
            overs: "4.0",
            maidens: "0",
            runs: "36",
            wickets: "1",
            econ: "9.00",
          ),
          bowlingRow(
            name: "A. Patel",
            overs: "3.0",
            maidens: "0",
            runs: "27",
            wickets: "3",
            econ: "9.00",
          ),
          bowlingRow(
            name: "J. Bumrah",
            overs: "4.0",
            maidens: "0",
            runs: "15",
            wickets: "4",
            econ: "3.75",
          ),

          keySection(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tabBar(),

        /// 🔥 Tab Views
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [teamView(), teamView()],
          ),
        ),
      ],
    );
  }
}
