import 'package:flutter/material.dart';

import './result_screen.dart';



import './models/pair.dart';
import './models/round.dart';

import './widgets/display/round_display.dart';
// import './widgets/summary.dart';
// import './widgets/made_display.dart';

import './widgets/score_editor/contract_editor.dart';
import './widgets/score_editor/declarer_editor.dart';
import './widgets/score_editor/trump_editor.dart';
import './widgets/score_editor/double_editor.dart';
import './widgets/score_editor/vulnerable_editor.dart';
import './widgets/score_editor/made_editor.dart';
import './widgets/confirm_button.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bridge Wizard beta',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.greenAccent,
        errorColor: Colors.grey,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  final List<Rounds> _round = [
    Rounds(round: 3, table: 2, board: 15, teamNS: 't001', teamEW: 't002'),
  ];

  final List<Pair> _team = [
    Pair(teamID: 't001', player1: 'John F. Kennedy', player2: 'Barack Obama'),
    Pair(teamID: 't002', player1: 'Vladimir Lenin', player2: 'Vladimir Putin'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bridge Wizard beta',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RoundDisplay(_round, _team),
            // Summary(),
            DeclarerEditor(),
            ContractEditor(),
            TrumpEditor(),
            DoubleEditor(),
            VulnerableEditor(),
            MadeEditor(),
            ConfirmButton(),
            // MadeDisplay(1),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () => {},
      // ),
    );
  }
}
