import 'package:bmi/response.dart';

class Calculate{
  
  static Response bmi(height,weight){
    double bmi;
    String message='';
    height=height/100;
    bmi = (weight / (height * height));

    if (bmi < 18.5) {
      message = "You are in Under weight category.";
    } else if (bmi < 25) {
      message = "You are in Noraml weight category.";
    } else if (bmi < 30) {
      message = "You are in Over weight category.";
    } else if (bmi > 30) {
      message = "You are Obese";
    }
    return Response(bmi: bmi, message: message);
  }
}