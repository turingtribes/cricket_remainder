import 'dart:math';

import 'package:flutter/material.dart';

class Graph extends StatefulWidget {
  const Graph({super.key});

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  Offset? touchPoint;

  final List<int> indiaRuns = [
    5,
    12,
    20,
    28,
    40,
    55,
    70,
    85,
    100,
    120,
    140,
    155,
    170,
    185,
    200,
    215,
    230,
    245,
    260,
    271,
  ];

  final List<int> ausRuns = [
    4,
    10,
    18,
    25,
    35,
    50,
    65,
    80,
    95,
    110,
    125,
    140,
    155,
    170,
    185,
    200,
    210,
    220,
    225,
  ];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget legend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.circle, color: Colors.green, size: 10),
        SizedBox(width: 6),
        Text("India", style: TextStyle(color: Colors.white)),
        SizedBox(width: 20),
        Icon(Icons.circle, color: Colors.orange, size: 10),
        SizedBox(width: 6),
        Text("Australia", style: TextStyle(color: Colors.white)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),

        /// GRAPH CARD
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    "Run Progression",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  Expanded(
                    child: GestureDetector(
                      onPanDown: (details) {
                        setState(() {
                          touchPoint = details.localPosition;
                        });
                      },
                      onPanUpdate: (details) {
                        setState(() {
                          touchPoint = details.localPosition;
                        });
                      },
                      onPanEnd: (_) {
                        setState(() {
                          touchPoint = null;
                        });
                      },
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (context, _) {
                          return SizedBox(
                            width: double.infinity,
                            height: 250,
                            child: CustomPaint(
                              painter: AdvancedGraphPainter(
                                indiaRuns: indiaRuns,
                                ausRuns: ausRuns,
                                progress: controller.value,
                                touchPoint: touchPoint,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  legend(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AdvancedGraphPainter extends CustomPainter {
  final List<int> indiaRuns;
  final List<int> ausRuns;
  final double progress;
  final Offset? touchPoint;

  AdvancedGraphPainter({
    required this.indiaRuns,
    required this.ausRuns,
    required this.progress,
    this.touchPoint,
  });

  /// 🔹 Text helper
  void drawText(
    Canvas canvas,
    String text,
    Offset offset, {
    double fontSize = 10,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: Colors.grey, fontSize: fontSize),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(canvas, offset);
  }

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    /// Leave space for axis labels
    double leftPadding = 30;
    double bottomPadding = 20;

    double chartWidth = width - leftPadding;
    double chartHeight = height - bottomPadding;

    final gridPaint = Paint()
      ..color = Colors.grey.shade800
      ..strokeWidth = 1;

    /// 🔹 Max runs
    double maxRuns = max(
      indiaRuns.reduce(max).toDouble(),
      ausRuns.reduce(max).toDouble(),
    );

    /// 🔹 Draw Grid + Y labels
    for (int i = 0; i <= 5; i++) {
      double y = chartHeight * i / 5;

      canvas.drawLine(Offset(leftPadding, y), Offset(width, y), gridPaint);

      double value = (maxRuns / 5) * (5 - i);

      drawText(canvas, value.toInt().toString(), Offset(0, y - 6));
    }

    /// 🔥 DRAW CURVED LINE
    void drawSmoothLine(List<int> data, Color color) {
      final path = Path();
      final fillPath = Path();

      int visiblePoints = max(2, (data.length * progress).floor());

      List<Offset> points = [];

      for (int i = 0; i < visiblePoints; i++) {
        double x = leftPadding + (i / (indiaRuns.length - 1)) * chartWidth;
        double y = chartHeight - (data[i] / maxRuns) * chartHeight;

        points.add(Offset(x, y));
      }

      /// Curve
      path.moveTo(points.first.dx, points.first.dy);

      for (int i = 0; i < points.length - 1; i++) {
        final p0 = points[i];
        final p1 = points[i + 1];

        final controlX = (p0.dx + p1.dx) / 2;

        path.cubicTo(controlX, p0.dy, controlX, p1.dy, p1.dx, p1.dy);
      }

      /// Fill area
      fillPath.addPath(path, Offset.zero);
      fillPath.lineTo(points.last.dx, chartHeight);
      fillPath.lineTo(points.first.dx, chartHeight);
      fillPath.close();

      final gradient = LinearGradient(
        colors: [color.withValues(alpha: 0.3), Colors.transparent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );

      final fillPaint = Paint()
        ..shader = gradient.createShader(Rect.fromLTWH(0, 0, width, height));

      canvas.drawPath(fillPath, fillPaint);

      /// Glow
      final glowPaint = Paint()
        ..color = color.withValues(alpha: 0.3)
        ..strokeWidth = 8
        ..style = PaintingStyle.stroke
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

      canvas.drawPath(path, glowPaint);

      /// Main line
      final linePaint = Paint()
        ..color = color
        ..strokeWidth = 3
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      canvas.drawPath(path, linePaint);

      /// Points
      final dotPaint = Paint()..color = color;
      for (var p in points) {
        canvas.drawCircle(p, 3, dotPaint);
      }
    }

    /// 🔥 Draw both teams
    drawSmoothLine(indiaRuns, Colors.green);
    drawSmoothLine(ausRuns, Colors.orange);

    /// 🔹 X-axis labels (Overs)
    int totalOvers = indiaRuns.length;

    for (int i = 0; i < totalOvers; i += 2) {
      double x = leftPadding + (i / (totalOvers - 1)) * chartWidth;

      drawText(canvas, "${i + 1}", Offset(x - 6, chartHeight + 4));
    }

    /// 🔥 TOUCH INTERACTION
    if (touchPoint != null) {
      double touchX = touchPoint!.dx.clamp(leftPadding, width);

      int index = ((touchX - leftPadding) / chartWidth * (indiaRuns.length - 1))
          .round();

      if (index >= 0 && index < indiaRuns.length) {
        double indiaY =
            chartHeight - (indiaRuns[index] / maxRuns) * chartHeight;

        double ausY =
            chartHeight -
            (ausRuns[min(index, ausRuns.length - 1)] / maxRuns) * chartHeight;

        /// Vertical line
        canvas.drawLine(
          Offset(touchX, 0),
          Offset(touchX, chartHeight),
          Paint()
            ..color = Colors.white.withValues(alpha: 0.3)
            ..strokeWidth = 1,
        );

        /// Points highlight
        canvas.drawCircle(
          Offset(touchX, indiaY),
          6,
          Paint()..color = Colors.green,
        );

        canvas.drawCircle(
          Offset(touchX, ausY),
          6,
          Paint()..color = Colors.orange,
        );

        /// Tooltip
        final textPainter = TextPainter(
          text: TextSpan(
            text:
                "Over ${index + 1}\nIND: ${indiaRuns[index]}\nAUS: ${ausRuns[min(index, ausRuns.length - 1)]}",
            style: const TextStyle(color: Colors.white, fontSize: 11),
          ),
          textDirection: TextDirection.ltr,
        );

        textPainter.layout();

        final rect = Rect.fromLTWH(
          touchX + 8,
          10,
          textPainter.width + 10,
          textPainter.height + 10,
        );

        final bgPaint = Paint()..color = Colors.black.withValues(alpha: 0.8);

        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, const Radius.circular(6)),
          bgPaint,
        );

        textPainter.paint(canvas, Offset(rect.left + 5, rect.top + 5));
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
