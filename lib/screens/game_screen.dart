import 'package:flutter/material.dart';
import 'package:physics_ball/widgets/index.dart';
import 'package:physics_ball/constants/index.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double? ballX;
  double ballY = 0.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final availableHeight = screenHeight - appBarHeight - statusBarHeight;

    if (ballX == null) {
      ballX = (screenWidth / 2) - GameConstants.ballRadius;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Physics Ball'),
      ),
      body: Stack(
        children: [
          if (ballX != null)
            BallWidget(
              x: ballX!,
              y: ballY,
            ),
        ],
      ),
    );
  }
}
