import 'dart:math';
import 'package:physics_ball/constants/index.dart';
import 'package:physics_ball/models/index.dart';

class PhysicsService {
  final Random _random = Random();
  BallState updatePhysics(
    BallState state,
    double screenWidth,
    double availableHeight,
  ) {
    if (!state.isFalling || screenWidth == 0 || availableHeight == 0) {
      return state;
    }

    final ballDiameter = GameConstants.ballRadius * 2;
    double newVelocityY = state.velocityY + GameConstants.gravity;
    double newVelocityX = state.velocityX;

    double newX = (state.x ?? 0) + newVelocityX;
    double newY = state.y + newVelocityY;

    if (newX < 0) {
      newX = 0;
      newVelocityX = -newVelocityX * GameConstants.bounceDamping;
    } else if (newX + ballDiameter > screenWidth) {
      newX = screenWidth - ballDiameter;
      newVelocityX = -newVelocityX * GameConstants.bounceDamping;
    }

    if (newY < 0) {
      newY = 0;
      newVelocityY = -newVelocityY * GameConstants.bounceDamping;
    } else if (newY + ballDiameter > availableHeight) {
      newY = availableHeight - ballDiameter;
      newVelocityY = -newVelocityY * GameConstants.bounceDamping;
    }

    final isOnBottom = (newY + ballDiameter >= availableHeight - 1);

    if (isOnBottom) {
      newVelocityX *= GameConstants.friction;
      if (newVelocityX.abs() < GameConstants.minVelocity) {
        newVelocityX = 0.0;
      }
    }

    final isVelocityLow =
        newVelocityY.abs() < GameConstants.minVelocity &&
        newVelocityX.abs() < GameConstants.minVelocity;

    if (isOnBottom && isVelocityLow) {
      return BallState(
        x: newX,
        y: availableHeight - ballDiameter,
        velocityX: 0.0,
        velocityY: 0.0,
        isFalling: false,
      );
    }

    return state.copyWith(
      x: newX,
      y: newY,
      velocityX: newVelocityX,
      velocityY: newVelocityY,
    );
  }

  BallState resetBall(double screenWidth) {
    if (screenWidth == 0) {
      return const BallState(
        x: null,
        y: 0.0,
        velocityX: 0.0,
        velocityY: 0.0,
        isFalling: false,
      );
    }

    final ballDiameter = GameConstants.ballRadius * 2;
    final buttonHeight = 56.0;
    final buttonTop = 8.0;
    final spacing = 20.0;

    final isLeftSide = _random.nextBool();
    final initialX = isLeftSide ? 0.0 : screenWidth - ballDiameter;
    final initialVelocityX = isLeftSide
        ? GameConstants.initialVelocityX
        : -GameConstants.initialVelocityX;

    return BallState(
      x: initialX,
      y: buttonTop + buttonHeight + spacing,
      velocityX: initialVelocityX,
      velocityY: 0.0,
      isFalling: true,
    );
  }

  BallState initializeBall(double screenWidth) {
    if (screenWidth == 0) {
      return const BallState(
        x: null,
        y: 0.0,
        velocityX: 0.0,
        velocityY: 0.0,
        isFalling: false,
      );
    }

    final ballDiameter = GameConstants.ballRadius * 2;
    final buttonHeight = 56.0;
    final buttonTop = 8.0;
    final spacing = 20.0;

    final isLeftSide = _random.nextBool();
    final initialX = isLeftSide ? 0.0 : screenWidth - ballDiameter;
    final initialVelocityX = isLeftSide
        ? GameConstants.initialVelocityX
        : -GameConstants.initialVelocityX;

    return BallState(
      x: initialX,
      y: buttonTop + buttonHeight + spacing,
      velocityX: initialVelocityX,
      velocityY: 0.0,
      isFalling: false,
    );
  }
}
