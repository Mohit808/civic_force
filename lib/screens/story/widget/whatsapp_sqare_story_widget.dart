import 'dart:ui';

import 'package:flutter/material.dart';

class WhatsAppSquareSegmentBorder extends CustomPainter {
  final int segments;
  final List<Color> segmentColors;
  final double strokeWidth;
  final double gap;
  final double radius;

  WhatsAppSquareSegmentBorder({
    required this.segments,
    required this.segmentColors,
    this.strokeWidth = 3,
    this.gap = 6,
    this.radius = 10,
  }) : assert(segmentColors.length >= segments,
  'segmentColors length must be >= segments');

  @override
  void paint(Canvas canvas, Size size) {
    if (segments <= 0) return;

    final rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(radius)),
      );

    final PathMetric metric = path.computeMetrics().first;
    final double totalLength = metric.length;

    if (segments == 1) {
      final paint = Paint()
        ..color = segmentColors.first
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      canvas.drawPath(path, paint);
      return;
    }

    final double segmentLength =
        (totalLength - (segments * gap)) / segments;

    double start = 0;

    for (int i = 0; i < segments; i++) {
      final paint = Paint()
        ..color = segmentColors[i]
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      final extractPath =
      metric.extractPath(start, start + segmentLength);

      canvas.drawPath(extractPath, paint);
      start += segmentLength + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


class WhatsAppSquareStoryWidget extends StatelessWidget {
  final Widget child;
  final List<bool>? isViewedList; // true = viewed
  final double? height;
  final double? width;

  const WhatsAppSquareStoryWidget({
    super.key,
    required this.child,
    required this.isViewedList,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final segmentColors = isViewedList?.map(
          (isViewed) => isViewed ? Colors.grey : Colors.green,
    ).toList();

    return SizedBox(
      height: height ?? 120,
      width: width ?? 90,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(width ?? 90, height ?? 120),
            painter: WhatsAppSquareSegmentBorder(
              segments: segmentColors!.length,
              segmentColors: segmentColors,
              strokeWidth: 2,
              radius: 12,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(3),
            height: (height ?? 120) - 4,
            width: (width ?? 90) - 4,
            decoration: BoxDecoration(
              color: const Color(0xff25D366),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: child),
          ),
        ],
      ),
    );
  }
}
