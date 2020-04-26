import 'package:flutter/material.dart';
import '../../result_screen.dart';

//import '../score_editor/contract_editor.dart';

import '../../models/round.dart';
import '../../models/calculator.dart';

class CalculatingButton extends StatefulWidget {
  final List<Rounds> _round;
  final Calculator recentCalculator;
  
  CalculatingButton(this._round, this.recentCalculator);

  @override
  _CalculatingButtonState createState() => _CalculatingButtonState();
}

class _CalculatingButtonState extends State<CalculatingButton> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        RaisedButton(
          child: Text('Calculating'),
          color: Theme.of(context).primaryColor,
          textColor: Theme.of(context).textTheme.button.color,
          onPressed: () {
            widget.recentCalculator.scoring();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResultPage(widget._round, widget.recentCalculator)),
            );
          },
        ),
      ],
    );
  }
}
