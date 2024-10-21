import 'package:flutter/material.dart';
import 'reusable_Card.dart';

class HeightCard extends StatelessWidget {
  final int height;
  final ValueChanged<int> onChanged;

  const HeightCard({
    super.key,
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: const Color(0xFF1D1E33),
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'ALTURA',
            style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                height.toString(),
                style: const TextStyle(
                    fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
              const Text(
                'cm',
                style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
              ),
            ],
          ),
          Slider(
            value: height.toDouble(),
            min: 120.0,
            max: 220.0,
            activeColor: const Color(0xFFEB1555),
            inactiveColor: const Color(0xFF8D8E98),
            onChanged: (double newValue) {
              onChanged(newValue.round());
            },
          ),
        ],
      ),
    );
  }
}
