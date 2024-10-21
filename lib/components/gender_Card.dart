import 'package:flutter/material.dart';
import 'reusable_Card.dart';
import 'icon_Content.dart';

class GenderCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const GenderCard({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ReusableCard(
        color: selected ? const Color(0xFF1D1E33) : const Color(0xFF111328),
        cardChild: IconContent(
          icon: icon,
          label: label,
        ),
      ),
    );
  }
}
