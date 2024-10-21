import 'package:flutter/material.dart';
import 'dart:math';
import 'gender_Card.dart';
import 'height_Card.dart';
import 'weight_Age_Card.dart';
import 'results_Page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 59;
  int age = 22;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALCULADORA IMC'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GenderCard(
                    label: 'MASCULINO',
                    icon: Icons.male,
                    selected: isMale,
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GenderCard(
                    label: 'FEMININO',
                    icon: Icons.female,
                    selected: !isMale,
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: HeightCard(
              height: height,
              onChanged: (newHeight) {
                setState(() {
                  height = newHeight;
                });
              },
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: WeightAgeCard(
                    label: 'PESO',
                    value: weight,
                    onDecrement: () {
                      setState(() {
                        weight--;
                      });
                    },
                    onIncrement: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: WeightAgeCard(
                    label: 'IDADE',
                    value: age,
                    onDecrement: () {
                      setState(() {
                        age--;
                      });
                    },
                    onIncrement: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              double bmi = weight / pow(height / 100, 2);
              String result;
              String interpretation;

              if (bmi >= 25) {
                result = 'Acima do peso';
                interpretation =
                    'Você está com o peso acima do normal. Tente se exercitar mais.';
              } else if (bmi > 18.5) {
                result = 'Normal';
                interpretation = 'Você está com o peso normal. Bom trabalho!';
              } else {
                result = 'Abaixo do Peso';
                interpretation =
                    'Você está com o peso abaixo do normal. Você pode comer um pouco mais.';
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: bmi.toStringAsFixed(1),
                    resultText: result,
                    interpretation: interpretation,
                  ),
                ),
              );
            },
            child: Container(
              color: const Color(0xFFEB1555),
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
              child: const Center(
                child: Text(
                  'CALCULAR',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
