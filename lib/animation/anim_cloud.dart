import 'package:flutter/material.dart';

class CloudAnim extends StatefulWidget {
  const CloudAnim({super.key});

  @override
  State<CloudAnim> createState() => _CloudAnimState();
}

class _CloudAnimState extends State<CloudAnim>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween(
          begin: Offset.zero, end: const Offset(0.2, 0))
      .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image.asset('assets/images/cloud.png', height: 300),
        Flexible(
          child: SlideTransition(
            position: _animation,
            child: Image.asset('assets/images/cloud.png', height: 100),
          ),
        ),
        Flexible(
          child: SlideTransition(
            position: _animation,
            child: Image.asset('assets/images/cloud.png', height: 100),
          ),
        ),
      ],
    );
  }
}
