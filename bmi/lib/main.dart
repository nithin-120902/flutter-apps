// ignore_for_file: prefer_const_constructors

import 'package:bmi/calculate.dart';
import 'package:bmi/request.dart';
import 'package:bmi/response.dart';
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
  
  final _heightController = TextEditingController();

  final _weightController = TextEditingController();

  Response response = Response(bmi: 0, message: "Please Enter the values");

  final _key = GlobalKey<FormState>();

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
        child: Container(
          width:320,
          padding:EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)
              ),
              color: Colors.white,
            ),
          child: Form(
            key: _key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Weight in kgs',
                    labelStyle: TextStyle(
                      fontSize: 20
                    ),
                    floatingLabelAlignment: FloatingLabelAlignment.start
                  ),
                  validator: (value){
                    return (value == null || value.isEmpty) ? 'Numeric Value Required' : null;
                  },
                  cursorHeight: 25.0,
                  keyboardType: const TextInputType.numberWithOptions(decimal:true),
                  controller: _weightController,
                ),
                SizedBox(
                  height:20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Height in cms',
                      labelStyle: TextStyle(fontSize: 20),
                      floatingLabelAlignment: FloatingLabelAlignment.start),
                  validator: (value) {
                    return (value == null || value.isEmpty)
                        ? 'Numeric Value Required'
                        : null;
                  },
                  cursorHeight: 25.0,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _heightController,
                ),
                SizedBox(
                  height:20,
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      if (_key.currentState!.validate()) {
                        Request req = Request(
                            height: double.parse(_heightController.value.text),
                            weight: double.parse(_weightController.value.text));
                        response = Calculate.bmi(req.height, req.weight);
                        print(response.bmi);
                        print(response.message);
                      }
                    });
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
                  (response.bmi).toString(),
                ),
                SizedBox(
                    height: 30,
                ),
                Text(
                  (response.message).toString()
                ),
              ]
            ),
          ),
        ),
      ),
    ),
  );
  }
}