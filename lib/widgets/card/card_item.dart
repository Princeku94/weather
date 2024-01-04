import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {super.key,
      required this.time,
      required this.temp,
      required this.comment,
      required this.icon,
      required this.color});

  final String time;

  final String temp;

  final String comment;

  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 14, color: Colors.white60),
            ),
            const SizedBox(
              height: 8,
            ),
          
            Text(
              icon,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '$temp°',
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              comment,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white60),
            ),
          ],
        ),
      ),
    );
  }
}
