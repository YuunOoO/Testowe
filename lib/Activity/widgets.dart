import 'package:diff_find/Pages/shownumber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//input widget
Widget input(final data) {
  return TextField(
    controller: data,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintMaxLines: null,
      hintText: 'Podaj numery po przecinku',
    ),
  );
}

late int flag;
Widget confirm(BuildContext context, TextEditingController nr) {
  return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 500, height: 55),
      child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 255, 255, 255)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(202, 119, 60, 106)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side:
                          BorderSide(color: Color.fromARGB(125, 97, 0, 105))))),
          onPressed: () {
            if (OpenGate(nr.text)) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => shownumber(flag)),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Złe dane!')),
              );
            }
          },
          child: Text('Wyszukaj', style: TextStyle(fontSize: 25))));
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return int.tryParse(s) != null;
}

bool OpenGate(String text) {
  //length text
  if (text.isEmpty) return false;
  text = text + ","; //last number fix
  late int modulo_result;
  List<int> numbers = [3];
  int leng = text.length;
  String tmp = ""; //one number
  int tmp2; // int helper
  int counter = 0; //counter for each number
  for (int i = 0; i < leng; i++) {
    if (text[i] != "," && isNumeric(text[i])) {
      //add numbers while no comma
      tmp += text[i];
    } else {
      if (text[i] != "," && i != leng - 1) return false; // wrong text
      //we have full number
      counter++;
      tmp2 = int.parse(tmp);
      print(tmp2);
      if (counter <= 3) {
        numbers.add(tmp2);
        if (counter == 3) {
          int even = 0;
          for (int k = 0; k <= 3; k++) if (numbers[k] % 2 == 0) even++;
          if (even <= 1)
            modulo_result = 0;
          else
            modulo_result = 1;
          print(even);
          i = -1; //++ = start 0
          print(modulo_result);
        }
      }
      if (counter > 3) {
        //we got more than 3 numbers
        if (tmp2 % 2 == modulo_result) {
          //found
          flag = tmp2; //send number
          return true;
        }
      }
      tmp = "";
    }
  }
  return false;
}
