import 'package:flutter/material.dart';
import '../methods/alert_result_dialog.dart';
import '../widgets/score_editor/score_editor.dart';
import '../methods/calculator.dart';
import '../widgets/display/board_display.dart';

class CalculatingScreen extends StatefulWidget {
  static const routeName = '/calculating-screen';

  @override
  _CalculatingScreenState createState() => _CalculatingScreenState();
}

class _CalculatingScreenState extends State<CalculatingScreen> {
  int _index = 0;
  bool action = false;

  void _indexIncrese(int totalBoard) {
    action = false;
    if (_index < (totalBoard - 1)) {
      setState(() {
        _index += 1;
      });
    } else {
      Navigator.of(context).pop(true);
    }
  }

  Calculator cal = Calculator(
    declarerIndex: 0,
    contractValue: 1,
    trumpIndex: 0,
    doubleIndex: 0,
    madeValue: 7,
  );

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final boardListString = routeArgs['board'].split(', ');
    final dataString = routeArgs['data'].split(', ');

    final boardLength = boardListString.length;
    final currentTable = dataString[0];
    final currentRound = dataString[1];

    final List recentRoundData = [
      currentTable,
      currentRound,
      boardListString[_index]
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Round ' + currentRound),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BoardDisplay(recentRoundData),
            ScoreEditor(cal),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text(
            'Confirm',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          icon: Icon(
            Icons.send,
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).textTheme.button.color,
          onPressed: () async {
            cal.scoring(int.parse(currentRound));
            action = await asyncConfirmDialog(context, cal);
            int declarerScore = cal.totalScores;
            if (action) {
              // ***** for sent data to database *****
              print('Table: ' +
                  currentTable +
                  ', Round: ' +
                  currentRound +
                  ', Board: ' +
                  boardListString[_index] +
                  ', (' +
                  cal.declarers +
                  ')\'s Score: $declarerScore, (' +
                  cal.nonDeclarers +
                  ')\'s Score: ${declarerScore * -1}, ');
              _indexIncrese(boardLength);
            }
          }),
    );
  }
}
