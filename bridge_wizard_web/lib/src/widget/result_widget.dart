import 'package:flutter/material.dart';


class ResultPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ResultPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Center(child:SizedBox(
    width: MediaQuery.of(context).size.width * 2/3,
  child:SingleChildScrollView(
    
    scrollDirection: Axis.vertical,
    child: FittedBox(
      child: DataTable(
        columns: <DataColumn>[
          DataColumn(
            label: Text('Rank'),
            
          ),
          DataColumn(
            label: Text('Team'),
          ),
          DataColumn(
            label: Text('Player1'),
          ),
          DataColumn(
            label: Text('Player2'),
          ),
          DataColumn(
            label: Text('Result'),
          )
        ],
        rows: <DataRow>[
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('Blackpink')),
            DataCell(Text('Jennie')),
            DataCell(Text('Lisa')),
            DataCell(Text('50')),
          ]),
          DataRow(cells: [
            DataCell(Text('2')),
            DataCell(Text('Blackpink 2')),
            DataCell(Text('Jisoo')),
            DataCell(Text('Rose')),
            DataCell(Text('47')),
          ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Text('Team 3')),
            DataCell(Text('A')),
            DataCell(Text('B')),
            DataCell(Text('39')),
          ]),
          DataRow(cells: [
            DataCell(Text('4')),
            DataCell(Text('Team 8')),
            DataCell(Text('K')),
            DataCell(Text('L')),
            DataCell(Text('36')),
          ]),
          DataRow(cells: [
            DataCell(Text('5')),
            DataCell(Text('Team 10')),
            DataCell(Text('O')),
            DataCell(Text('P')),
            DataCell(Text('32')),
          ]),
          DataRow(cells: [
            DataCell(Text('6')),
            DataCell(Text('Team 5')),
            DataCell(Text('E')),
            DataCell(Text('F')),
            DataCell(Text('30')),
          ]),
          DataRow(cells: [
            DataCell(Text('7')),
            DataCell(Text('Blackpink')),
            DataCell(Text('Jennie')),
            DataCell(Text('Lisa')),
            DataCell(Text('50')),
          ]),
          DataRow(cells: [
            DataCell(Text('8')),
            DataCell(Text('Blackpink')),
            DataCell(Text('Jennie')),
            DataCell(Text('Lisa')),
            DataCell(Text('50')),
          ]),
          DataRow(cells: [
            DataCell(Text('9')),
            DataCell(Text('Blackpink')),
            DataCell(Text('Jennie')),
            DataCell(Text('Lisa')),
            DataCell(Text('50')),
          ]),
          DataRow(cells: [
            DataCell(Text('10')),
            DataCell(Text('Blackpink')),
            DataCell(Text('Jennie')),
            DataCell(Text('Lisa')),
            DataCell(Text('50')),
          ]),
        ],
      ),
    ),
  ),
  
  )
              )
);
  }
}