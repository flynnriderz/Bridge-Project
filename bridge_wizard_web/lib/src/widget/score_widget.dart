import 'package:flutter/material.dart';
import 'package:bridge_wizard_web/src/commons/theme.dart';
import 'package:bridge_wizard_web/src/model/project_model.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    Key key,
    @required Size media,
  })  : _media = media,
        super(key: key);

  final Size _media;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: FittedBox(
      child: DataTable(
        columns: <DataColumn>[
          DataColumn(
            label: Text('Table'),
          ),
          DataColumn(
            label: Text('Status'),
          ),
        ],
        rows: <DataRow>[
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Icon(
    Icons.play_circle_filled,
    size: 24,
    color: Colors.green,
  ),),
          ]),
          DataRow(cells: [
            DataCell(Text('2')),
            DataCell(Icon(
    Icons.play_circle_filled,
    size: 24,
    color: Colors.green,
  ),),
          ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Icon(
    Icons.play_circle_filled,
    size: 24,
    color: Colors.green,
  ),),
          ]),
          DataRow(cells: [
            DataCell(Text('4')),
            DataCell(Icon(
    Icons.pause_circle_filled,
    size: 24,
    color: Colors.red,
  ),),
          ]),
          DataRow(cells: [
            DataCell(Text('5')),
            DataCell(Icon(
    Icons.play_circle_filled,
    size: 24,
    color: Colors.green,
  ),),
          ]),
        ],
      ),
    ),
  ),
  SizedBox( width: 20,),
  SizedBox(
    width: MediaQuery.of(context).size.width * 5 / 6,
  child:SingleChildScrollView(
    
    scrollDirection: Axis.vertical,
    child: FittedBox(
      child: DataTable(
        columns: <DataColumn>[
          DataColumn(
            label: Text('Table'),
            
          ),
          DataColumn(
            label: Text('Round'),
          ),
          DataColumn(
            label: Text('NS_team'),
          ),
          DataColumn(
            label: Text('EW_team'),
          ),
          DataColumn(
            label: Text('Board'),
          ),
          DataColumn(
            label: Text('Declaler'),
          ),
          DataColumn(
            label: Text('Trump'),
          ),
          DataColumn(
            label: Text('Double'),
          ),
          DataColumn(
            label: Text('Vulrenable'),
          ),
          DataColumn(
            label: Text('Score'),
          ),
        ],
        rows: <DataRow>[
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('1')),
            DataCell(Text('1')),
            DataCell(Text('2')),
            DataCell(Text('1')),
            DataCell(Text('N')),
            DataCell(Text('3NT')),
            DataCell(Text('-')),
            DataCell(Text('Yes')),
            DataCell(Text('540')),
            ]),
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('2')),
            DataCell(Text('1')),
            DataCell(Text('2')),
            DataCell(Text('2')),
            DataCell(Text('E')),
            DataCell(Text('5S')),
            DataCell(Text('-')),
            DataCell(Text('NO')),
            DataCell(Text('320')),
          ]),
          DataRow(cells: [
            DataCell(Text('2')),
            DataCell(Text('1')),
            DataCell(Text('2')),
            DataCell(Text('3')),
            DataCell(Text('3')),
            DataCell(Text('N')),
            DataCell(Text('4H')),
            DataCell(Text('X')),
            DataCell(Text('Yes')),
            DataCell(Text('354')),
          ]),
          DataRow(cells: [
            DataCell(Text('2')),
            DataCell(Text('2')),
            DataCell(Text('2')),
            DataCell(Text('3')),
            DataCell(Text('4')),
            DataCell(Text('E')),
            DataCell(Text('5NT')),
            DataCell(Text('X')),
            DataCell(Text('Yes')),
            DataCell(Text('840')),
          ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Text('1')),
            DataCell(Text('3')),
            DataCell(Text('4')),
            DataCell(Text('5')),
            DataCell(Text('S')),
            DataCell(Text('6D')),
            DataCell(Text('-')),
            DataCell(Text('NO')),
            DataCell(Text('-230')),
          ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Text('2')),
            DataCell(Text('3')),
            DataCell(Text('4')),
            DataCell(Text('6')),
            DataCell(Text('N')),
            DataCell(Text('5NT')),
            DataCell(Text('XX')),
            DataCell(Text('NO')),
            DataCell(Text('1080')),
          ]),
          DataRow(cells: [
            DataCell(Text('4')),
            DataCell(Text('1')),
            DataCell(Text('4')),
            DataCell(Text('5')),
            DataCell(Text('7')),
            DataCell(Text('W')),
            DataCell(Text('5C')),
            DataCell(Text('X')),
            DataCell(Text('NO')),
            DataCell(Text('-560')),
          ]),
          DataRow(cells: [
            DataCell(Text('4')),
            DataCell(Text('2')),
            DataCell(Text('4')),
            DataCell(Text('5')),
            DataCell(Text('8')),
            DataCell(Text('S')),
            DataCell(Text('4H')),
            DataCell(Text('-')),
            DataCell(Text('Yes')),
            DataCell(Text('640')),
          ]),
          DataRow(cells: [
            DataCell(Text('5')),
            DataCell(Text('1')),
            DataCell(Text('5')),
            DataCell(Text('6')),
            DataCell(Text('9')),
            DataCell(Text('E')),
            DataCell(Text('4C')),
            DataCell(Text('-')),
            DataCell(Text('Yes')),
            DataCell(Text('230')),
          ]),
          DataRow(cells: [
            DataCell(Text('5')),
            DataCell(Text('2')),
            DataCell(Text('5')),
            DataCell(Text('6')),
            DataCell(Text('10')),
            DataCell(Text('W')),
            DataCell(Text('6D')),
            DataCell(Text('-')),
            DataCell(Text('Yes')),
            DataCell(Text('1260')),
          ]),
        ],
      ),
    ),
  ),
  
  )
              ])
);
  }
}
