import 'package:flutter/material.dart';

import '../widgets/display/table_detail_display.dart';
import '../dummy_data/round_dummy_data.dart';
import 'calculating_screen.dart';

class ConfirmTableScreen extends StatefulWidget {
  static const routeName = '/confirm-table';

  @override
  _ConfirmTableScreenState createState() => _ConfirmTableScreenState();
}

class _ConfirmTableScreenState extends State<ConfirmTableScreen> {
  int _index = 0;

  void _indexIncrese(int totalRound) {
    setState(() {
      _index = _index >= (totalRound - 1) ? _index : _index + 1;
    });
    // if (_index == (totalRound)) {
    //   Navigator.of(context).pop();
    // }
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final tableId = routeArgs['id'];
    final tableNumber = routeArgs['number'];
    final tableList = DUMMY_COMPETITION.where((comp) {
      return comp.table.contains(tableId);
    }).toList();
    final int totalRound = tableList.length;

    final String compId = tableList[_index].competitionID;
    final String compTable = tableList[_index].table;
    final int compRound = tableList[_index].round;
    final List compBoardList = tableList[_index].board;
    final String teamNSid = tableList[_index].teamNS;
    final String teamEWid = tableList[_index].teamEW;

    final currentTable =
        DUMMY_TABLE.firstWhere((table) => table.id == compTable);
    final String boardListString = compBoardList.join(', ');
    final String dataString =
        currentTable.number.toString() + ', ' + compRound.toString();

    void tableDetails(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(
        CalculatingScreen.routeName,
        arguments: {
          'board': boardListString,
          'data': dataString,
        },
      ).then((result) => _indexIncrese(totalRound));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Table ' + tableNumber),
      ),
      body: TableDetailDisplay(
        id: compId,
        table: compTable,
        round: compRound,
        board: compBoardList,
        teamNS: teamNSid,
        teamEW: teamEWid,
      ),

      // ListView.builder(
      //   itemBuilder: (ctx, index) {
      //     return TableDisplay(
      //       id: tableList[index].competitionID,
      //       table: tableList[index].table,
      //       round: tableList[index].round,
      //       board: tableList[index].board,
      //       teamNS: tableList[index].teamNS,
      //       teamEW: tableList[index].teamEW,
      //     );
      //   },
      //   itemCount: tableList.length,
      // ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          'Play',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        icon: Icon(
          Icons.play_arrow,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).textTheme.button.color,
        onPressed: () => tableDetails(context),
      ),
    );
  }
}
