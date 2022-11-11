import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ToggleText extends StatefulWidget {
  const ToggleText({
    super.key,
  });

  @override
  State<ToggleText> createState() => _ToggleTextState();
}

List<bool> isslected = [
  true,
  false,
  false,
];



class _ToggleTextState extends State<ToggleText> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        borderRadius: BorderRadius.circular(10),
        borderWidth: 2,
        selectedBorderColor: Colors.black,
        isSelected: isslected,
        fillColor: Colors.black,
        focusColor: Colors.amber,
        selectedColor: Colors.white,
        children: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'سلفة شخصية ',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'سلفة حكومية ',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(.0),
            child: Text(
              'قرض ',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
        onPressed: (int index) {
          setState(() {
            for (var i = 0; i < isslected.length; i++) {
              isslected[i] = i == index;
            }
            
          });
          if (index == 0) {
              var privateselfa = 'سلفة شخصية ';
              print(privateselfa);
            }
            if (index == 1) {
              var publicselfa = 'سلفة حكومية ';
              print(publicselfa);
            }
            if (index == 2) {
              var loan = 'قرض ';
              print(loan);
            }
        },
      ),
    );
  }
}


