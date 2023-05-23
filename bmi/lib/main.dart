// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmi/calculate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMI());
}

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {

  List<String> _bmi = ["No Result","Enter height and weight"];
  
  final _heightController = TextEditingController();

  final _weightController = TextEditingController();

  void calculate(){
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    Calculate cal = Calculate(height: height,weight: weight);

    setState(() {
      _bmi = cal.bmi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[900],
        appBar: AppBar(
          title: Text('BMI calculator'),
          centerTitle: true,
          backgroundColor: Colors.teal[300],
        ),
      body: Center(
        child: SizedBox(
          width:320,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)
                ),
                color: Colors.white,
              ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true),
                    decoration:
                        InputDecoration(labelText: 'Weight (Kg)',icon: Icon(Icons.scale_outlined)),
                    controller: _weightController,
                  ),
                  SizedBox(
                    height:20,
                  ),
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true),
                    decoration:
                         InputDecoration(labelText: 'Height (cm)',icon: Icon(Icons.height)),
                    controller: _heightController,
                  ),
                  SizedBox(
                    height:20,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      calculate();
                    }, 
                    child:
                    Text(
                      "Calculate",
                    ), 
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    _bmi[0]
                  ),
                  SizedBox(
                      height: 30,
                  ),
                  Text(
                    _bmi[1],
                  )
                ],
              ),
            ),
          ),
        ),
      ), 
      ),
    );
  }
}