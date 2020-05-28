import 'package:flutter/material.dart';
import '../../dummy_data/round_dummy_data.dart';

class TableDetailDisplay extends StatelessWidget {
  final String id;
  final String table;
  final int round;
  final List board;
  final String teamNS;
  final String teamEW;

  TableDetailDisplay({
    @required this.id,
    @required this.table,
    @required this.round,
    @required this.board,
    @required this.teamNS,
    @required this.teamEW,
  });

  @override
  Widget build(BuildContext context) {

    ////ดึงค่าตาก Competitor ใน Database มาเช็คว่าตรงกันหรือไม่
    final selectedNS = dummyPair.firstWhere((pair) => pair.team_NO == teamNS);
    final selectedEW = dummyPair.firstWhere((pair) => pair.team_NO == teamEW);

    final double headerFontSize = 18;
    final double teamfontSize = 30;
    final double nameFontSize = 25;

    String combineBoardtoString(List board) {
      String finalString = ' ';
      var len = board.length;
      for (var i = 0; i < len; i++) {
        finalString += board[i].toString();
        if ((i + 1) < len) {
          finalString += ', ';
        }
      }
      return finalString;
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            elevation: 6,
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Round: $round',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: headerFontSize,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Board: ' + combineBoardtoString(board),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: headerFontSize,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Spacer(),
          Card(
            elevation: 6,
            margin: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'North - South',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: teamfontSize,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        selectedNS.player1 == ''
                            ? '-'
                            : '${selectedNS.player1}',
                        style: TextStyle(
                          fontSize: nameFontSize,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        selectedNS.player2 == ''
                            ? '-'
                            : '${selectedNS.player2}',
                        style: TextStyle(
                          fontSize: nameFontSize,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Spacer(),
          Card(
            elevation: 6,
            margin: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'East - West',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: teamfontSize,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        selectedEW.player1 == ''
                            ? '-'
                            : '${selectedEW.player1}',
                        style: TextStyle(
                          fontSize: nameFontSize,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        selectedEW.player2 == ''
                            ? '-'
                            : '${selectedEW.player2}',
                        style: TextStyle(
                          fontSize: nameFontSize,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
