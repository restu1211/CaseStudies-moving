import 'package:flutter/material.dart';

void main() {
  runApp(const MovingBoxApp());
}

class MovingBoxApp extends StatelessWidget {
  const MovingBoxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovingBoxScreen(),
    );
  }
}

class MovingBoxScreen extends StatefulWidget {
  @override
  _MovingBoxScreenState createState() => _MovingBoxScreenState();
}

class _MovingBoxScreenState extends State<MovingBoxScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(1.5, 0), // Geser ke kanan
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Jalankan animasi secara berulang
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moving Box Animation'),
      ),
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
