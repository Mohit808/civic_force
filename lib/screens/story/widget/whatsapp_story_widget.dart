// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// class WhatsAppSegmentBorder extends CustomPainter {
//   final int segments;
//   final Color color;
//   final double strokeWidth;
//
//   WhatsAppSegmentBorder({
//     required this.segments,
//     this.color = Colors.green,
//     this.strokeWidth = 4,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     if (segments <= 0) return;
//
//     final center = Offset(size.width / 2, size.height / 2);
//     final double radius = size.width / 2.2;
//
//     final paint = Paint()
//       ..color = color
//       ..strokeWidth = strokeWidth
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;
//
//     final Rect rect = Rect.fromCircle(center: center, radius: radius);
//
//     if (segments == 1) {
//       // 👉 No gap, draw full circle
//       canvas.drawArc(rect, 0, 2 * pi, false, paint);
//       return;
//     }
//
//     double fullAngle = 2 * pi;
//     double gapAngle = fullAngle * 0.04; // gap = 10% (can adjust)
//     double segmentAngle = (fullAngle - (segments * gapAngle)) / segments;
//
//     double startAngle = -pi / 2;
//
//     for (int i = 0; i < segments; i++) {
//       canvas.drawArc(
//         Rect.fromCircle(center: center, radius: radius),
//         startAngle,
//         segmentAngle,
//         false,
//         paint,
//       );
//       startAngle += segmentAngle + gapAngle;
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
//
//
// class WhatsAppStoryWidget extends StatelessWidget {
//   final Widget child;
//   final int storyCount;
//   final double? size;
//
//   const WhatsAppStoryWidget({
//     super.key,
//     required this.child,
//     required this.storyCount,
//     this.size,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: size??65,
//       width: size??65,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           CustomPaint(
//             size: Size(size??65, size??65),
//             painter: WhatsAppSegmentBorder(
//               segments: storyCount,
//               color: Colors.green,
//               strokeWidth: 2,
//             ),
//           ),
//           Container(
//             height:  size!=null?(size!-4):53,
//             width: size!=null?(size!-4):53,
//             decoration: const BoxDecoration(
//               color: Color(0xff25D366),
//               shape: BoxShape.circle,
//             ),
//             child: Center(child: child),
//           )
//         ],
//       ),
//     );
//   }
// }
