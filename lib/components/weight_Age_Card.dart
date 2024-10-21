import 'package:flutter/material.dart';
import 'reusable_Card.dart';
import 'roundIcon_Button.dart';

class WeightAgeCard extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const WeightAgeCard({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: const Color(0xFF1D1E33),
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
          ),
          Text(
            value.toString(),
            style: const TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundIconButton(
                icon: Icons.remove,
                onPressed: onDecrement,
              ),
              const SizedBox(width: 10.0),
              RoundIconButton(
                icon: Icons.add,
                onPressed: onIncrement,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
