import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconContent({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        const SizedBox(height: 15.0),
        Text(
          label,
          style: const TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
        ),
      ],
    );
  }
}
