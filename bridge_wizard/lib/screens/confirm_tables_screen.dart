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
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final tableId = routeArgs['id'];
    final tableNumber = routeArgs['number'];

    ////ดึงค่าจาก Round ใน Database
    final tableList = dummyRound.where((comp) {
      return comp.table_NO.contains(tableNumber);
    }).toList();
    //print(tableList);
    final int totalRound = tableList.length;

    final String compId = tableList[_index].roundID;
    final String compTable = tableList[_index].table_NO;
    final int compRound = tableList[_index].round_NO;
    final List compBoardList = tableList[_index].board_NO;
    final String teamNS = tableList[_index].team_NS;
    final String teamEW = tableList[_index].team_EW;

    ////Encoder สำหรับส่งค่าผ่านไปอีกหน้า ต้องการ Table.table_NO
    final currentTable =
        dummyTable.firstWhere((table) => table.table_NO == compTable);
    final String boardListString = compBoardList.join(', ');
    final String dataString =
        currentTable.table_NO + ', ' + compRound.toString();
    ////Encoder

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
      body: tableList != [] ? TableDetailDisplay(
        id: compId,
        table: compTable,
        round: compRound,
        board: compBoardList,
        teamNS: teamNS,
        teamEW: teamEW,
      ) : null,

      // body: ListView.builder(
      //   itemBuilder: (ctx, index) {
      //     return TableDetailDisplay(
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
