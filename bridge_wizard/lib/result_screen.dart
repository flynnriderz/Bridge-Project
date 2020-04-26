import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


import './models/round.dart';
import './models/calculator.dart';

import './widgets/button/confirm_button.dart';
import './widgets/display/result_display.dart';

class ResultPage extends StatefulWidget {
  final List<Rounds> _round;
  final Calculator recentCalculator;
  
  ResultPage(this._round, this.recentCalculator);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  // final List<Rounds> _round = [
  //   Rounds(round: 3, table: 2, board: 16, teamNS: 't001', teamEW: 't002'),
  // ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bridge Wizard beta',
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ResultDisplay(widget._round, widget.recentCalculator),
            ConfirmButton(),
          ],
        ),
      ),
    );
  }
}
