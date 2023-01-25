import 'package:flutter/material.dart';

class ShimmerScreen extends StatefulWidget {
  const ShimmerScreen({super.key});

  @override
  State<ShimmerScreen> createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.green,
        ),
      ),
    );
  }
}
