class Calculate{
  double? height;
  double? weight;
  double? _bmi;
  String? message;

  Calculate({this.height,this.weight,this.message=""});

  List<String> bmi(){
    if (height == null || height! <= 0 || weight == null || weight! <= 0) {
      return ["No result","Enter Valid Height and Weight"];
    }
    height=height!/100;
    _bmi = (weight! / (height! * height!));

    if (_bmi! < 18.5) {
      message = "You are in Under weight category.";
    } else if (_bmi! < 25) {
      message = "You are in Noraml weight category.";
    } else if (_bmi! < 30) {
      message = "You are in Over weight category.";
    } else if (_bmi! > 30) {
      message = "You are Obese";
    }
    return [_bmi.toString(),message.toString()];
  }
}