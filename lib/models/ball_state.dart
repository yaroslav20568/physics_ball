class BallState {
  final double? x;
  final double y;
  final double velocityX;
  final double velocityY;
  final bool isFalling;

  const BallState({
    this.x,
    required this.y,
    required this.velocityX,
    required this.velocityY,
    required this.isFalling,
  });

  BallState copyWith({
    double? x,
    double? y,
    double? velocityX,
    double? velocityY,
    bool? isFalling,
  }) {
    return BallState(
      x: x ?? this.x,
      y: y ?? this.y,
      velocityX: velocityX ?? this.velocityX,
      velocityY: velocityY ?? this.velocityY,
      isFalling: isFalling ?? this.isFalling,
    );
  }

  BallState reset() {
    return const BallState(
      x: null,
      y: 0.0,
      velocityX: 0.0,
      velocityY: 0.0,
      isFalling: false,
    );
  }
}
