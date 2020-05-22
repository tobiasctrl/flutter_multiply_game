import 'dart:math';

String gettext(var equationtrue, var intrange){
  var result = 0;
  while(result < 6){
  result = new Random().nextInt(intrange);
  }
  //print(result);
  var rest = 1;
  List noRestval = [];
  String equation = "";
  while (rest != 0)
  {
  for(var i = 2; i < 6; i++)
  {
    rest = result % i;
    //print(result % i);
    if (rest == 0){
      for(var j = 2; j < result; j++){
        if(result % j == 0){
          noRestval.add(j);
        }
      }
      break;
    }   
  }
  if(noRestval.isNotEmpty){
    var randomlistitem = new Random().nextInt(noRestval.length);
    var pickedval = noRestval[randomlistitem];
    if(equationtrue == 0){
      while(result % pickedval == 0){
      pickedval += (new Random().nextInt(3)) + 1;
      }
    }
    //equation = [pickedval.toString() + "×" + ((result/pickedval).toInt()).toString() + " = " + (result).toString(), equtiontrue];
    equation = pickedval.toString() + "×" + ((result/pickedval).toInt()).toString() + " = " + (result).toString();
    //print(equation);
    return equation;
  }
  if(rest != 0){
    result++;
  }
  //print(result);
  
}
return equation;
}