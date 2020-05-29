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

    //// Decoder จากหน้าก่อน
    final boardListString = routeArgs['board'].split(', ');
    final dataString = routeArgs['data'].split(', ');
    //// Decoder จากหน้าก่อน

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
            String declarerScore = cal.totalScores.toString();
            String declarer = cal.declarerSide;
            String doubledString = cal.doubleStrings;
            String trumpString = cal.trumpStrings;
            String vulString = cal.vulnerableStrings;
            if (action) {
              //// ส่งข้อมูลนี้ไปยัง database แทนการ print
              print('Table: ' +
                  currentTable + //Table_NO
                  ', Round: ' +
                  currentRound + //Round_NO
                  ', Board: ' +
                  boardListString[_index] + //Board_NO
                  ', Declarer: ' +
                  declarer); //declarer
              print('Score: ' +
                      declarerScore + //score
                      ', Double: ' +
                      doubledString + //double
                      ', Trump: ' +
                      trumpString + //double
                      ', Vulnerable: ' +
                      vulString //double
                  );
              _indexIncrese(boardLength);
            }
          }),
    );
  }
}
