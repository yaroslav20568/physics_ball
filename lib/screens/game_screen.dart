import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:physics_ball/widgets/index.dart';
import 'package:physics_ball/constants/index.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  double? ballX;
  double ballY = 0.0;
  double velocityX = 0.0;
  double velocityY = 0.0;
  bool isFalling = false;
  late Ticker _ticker;
  double screenWidth = 0.0;
  double availableHeight = 0.0;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_updatePhysics);
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _updateScreenDimensions(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = mediaQuery.padding.top;
    availableHeight = screenHeight - appBarHeight - statusBarHeight;
  }

  void _resetBall() {
    setState(() {
      ballX = (screenWidth / 2) - GameConstants.ballRadius;
      ballY = 0.0;
      velocityX = 0.0;
      velocityY = 0.0;
      isFalling = true;
    });
    _ticker.start();
  }

  void _updatePhysics(Duration elapsed) {
    if (!isFalling || screenWidth == 0 || availableHeight == 0) return;

    final ballDiameter = GameConstants.ballRadius * 2;

    velocityY += GameConstants.gravity;

    double newX = (ballX ?? 0) + velocityX;
    double newY = ballY + velocityY;

    if (newX < 0) {
      newX = 0;
      velocityX = -velocityX * GameConstants.bounceDamping;
    } else if (newX + ballDiameter > screenWidth) {
      newX = screenWidth - ballDiameter;
      velocityX = -velocityX * GameConstants.bounceDamping;
    }

    if (newY < 0) {
      newY = 0;
      velocityY = -velocityY * GameConstants.bounceDamping;
    } else if (newY + ballDiameter > availableHeight) {
      newY = availableHeight - ballDiameter;
      velocityY = -velocityY * GameConstants.bounceDamping;
    }

    final isOnBottom = (newY + ballDiameter >= availableHeight - 1);
    final isVelocityLow =
        velocityY.abs() < GameConstants.minVelocity &&
        velocityX.abs() < GameConstants.minVelocity;

    if (isOnBottom && isVelocityLow) {
      setState(() {
        ballX = newX;
        ballY = availableHeight - ballDiameter;
        velocityX = 0.0;
        velocityY = 0.0;
        isFalling = false;
      });
      _ticker.stop();
      return;
    }

    setState(() {
      ballX = newX;
      ballY = newY;
    });
  }

  @override
  Widget build(BuildContext context) {
    _updateScreenDimensions(context);

    if (ballX == null && screenWidth > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            ballX = (screenWidth / 2) - GameConstants.ballRadius;
          });
        }
      });
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Physics Ball')),
      body: Stack(
        children: [if (ballX != null) BallWidget(x: ballX!, y: ballY)],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _resetBall,
        label: const Text('Сбросить'),
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
