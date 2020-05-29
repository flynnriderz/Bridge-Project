import 'package:flutter/material.dart';
import '../widgets/display/result_display.dart';
import '../methods/calculator.dart';

//enum ConfirmAction { Cancel, Accept }
Future<bool> asyncConfirmDialog(
    BuildContext context, Calculator recentCalculator) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false, 
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Need A Comfimation From ' + recentCalculator.nonDeclarerSide,
          textAlign: TextAlign.center,
        ),
        content: ResultDisplay(recentCalculator),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        buttonPadding: EdgeInsets.all(5),
        actions: <Widget>[
          FlatButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          FlatButton(
            child: const Text('Accept'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          )
        ],
      );
    },
  );
}
