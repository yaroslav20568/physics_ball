import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:physics_ball/widgets/index.dart';
import 'package:physics_ball/constants/index.dart';
import 'package:physics_ball/models/index.dart';
import 'package:physics_ball/services/index.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  BallState _ballState = const BallState(
    x: null,
    y: 0.0,
    velocityX: 0.0,
    velocityY: 0.0,
    isFalling: false,
  );
  late Ticker _ticker;
  late PhysicsService _physicsService;
  double screenWidth = 0.0;
  double availableHeight = 0.0;

  @override
  void initState() {
    super.initState();
    _physicsService = PhysicsService();
    _ticker = createTicker(_updatePhysics);
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _updateScreenDimensions(Size size) {
    screenWidth = size.width;
    availableHeight = size.height;
  }

  void _resetBall() {
    final newState = _physicsService.resetBall(screenWidth);
    setState(() {
      _ballState = newState;
    });
    if (newState.isFalling) {
      _ticker.start();
    }
  }

  void _updatePhysics(Duration elapsed) {
    final newState = _physicsService.updatePhysics(
      _ballState,
      screenWidth,
      availableHeight,
    );

    if (!newState.isFalling && _ballState.isFalling) {
      _ticker.stop();
    }

    setState(() {
      _ballState = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physics Ball'),
        backgroundColor: AppColors.appBarBackground,
        foregroundColor: AppColors.appBarForeground,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            _updateScreenDimensions(constraints.biggest);

            if (_ballState.x == null && screenWidth > 0) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() {
                    _ballState = _physicsService.initializeBall(screenWidth);
                  });
                }
              });
            }

            return Stack(
              children: [
                if (_ballState.x != null)
                  BallWidget(x: _ballState.x!, y: _ballState.y),
                Positioned(
                  right: 16.0,
                  top: 8.0,
                  child: FloatingActionButton.extended(
                    onPressed: _resetBall,
                    label: const Text('Drop'),
                    icon: const Icon(Icons.arrow_downward),
                    backgroundColor: AppColors.buttonBackground,
                    foregroundColor: AppColors.buttonForeground,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
