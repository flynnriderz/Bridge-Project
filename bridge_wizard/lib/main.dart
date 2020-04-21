
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './models/player.dart';
import './models/pair.dart';
import './models/table.dart';
import './widgets/round_display.dart';
import './widgets/contract_editor.dart';
import './widgets/by_editor.dart';
import './widgets/trump_editor.dart';
import './widgets/double_editor.dart';
import './widgets/vulnerable_editor.dart';
import './widgets/made_editor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bridge Wizard beta',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.deepOrangeAccent,
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Player> _playerName = [
    Player(id: 'p1', firstName: 'John F.', lastname: 'Kennedy'),
    Player(id: 'p2', firstName: 'Barack', lastname: 'Obama'),
    Player(id: 'p3', firstName: 'Vladimir', lastname: 'Lenin'),
    Player(id: 'p4', firstName: 'Vladimir', lastname: 'Putin'),
  ];

  final List<Pair> _team = [
    Pair(teamID: 't001', firstID: 'p1', secondID: 'p2'),
    Pair(teamID: 't002', firstID: 'p3', secondID: 'p4'),
  ];

  final List<Tables> _table = [
    Tables(table: 2, round: 3, board: 16, teamNS: 't001', teamEW: 't002'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bridge Wizard (beta)',
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.add),
        //     onPressed: () {},
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RoundDisplay(_table, _team, _playerName),
            ByEditor(),
            ContractEditor(),
            TrumpEditor(),
            DoubleEditor(),
            VulnerableEditor(),
            MadeEditor(),
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
