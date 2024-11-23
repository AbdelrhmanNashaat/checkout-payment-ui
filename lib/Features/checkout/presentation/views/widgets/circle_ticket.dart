import 'package:flutter/material.dart';

class CustomCircleTicket extends StatelessWidget {
  final double left;
  const CustomCircleTicket({
    super.key,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 580,
      left: left,
      child: const CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
      ),
    );
  }
}
