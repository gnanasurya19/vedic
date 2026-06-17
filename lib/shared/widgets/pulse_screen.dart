import 'package:flutter/material.dart';

class PulseScreen extends StatefulWidget {
  const PulseScreen({super.key});

  @override
  State<PulseScreen> createState() => _PulseScreenState();
}
class _PulseScreenState extends State<PulseScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  static const double circleRadius = 100.0;
  static const double rippleSpread = 25.0; // outside spread in px

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(); // always looping

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1 + (rippleSpread / circleRadius), // ~1.25 scale
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(
      begin: 0.6,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3D9F5), // light blue background
      body: Center(
        child: SizedBox(
          width: circleRadius * 2 + rippleSpread * 2 + 20,
          height: circleRadius * 2 + rippleSpread * 2 + 20,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Ripple ring
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Opacity(
                      opacity: _opacityAnimation.value,
                      child: Container(
                        width: circleRadius * 2,
                        height: circleRadius * 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                      ),
                    ),
                  );
                },
              ),

              // White circle
              Container(
                width: circleRadius * 2,
                height: circleRadius * 2,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                // your content inside goes here
                child: const Center(
                  child: Text('👋', style: TextStyle(fontSize: 40)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
