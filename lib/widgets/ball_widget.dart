import 'package:flutter/material.dart';
import 'package:physics_ball/constants/index.dart';

class BallWidget extends StatelessWidget {
  final double x;
  final double y;

  const BallWidget({super.key, required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Icon(
        Icons.sports_basketball,
        size: GameConstants.ballRadius * 2,
        color: Colors.black,
      ),
    );
  }
}
