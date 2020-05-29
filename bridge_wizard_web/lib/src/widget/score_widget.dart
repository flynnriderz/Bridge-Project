import 'package:flutter/material.dart';
import 'package:bridge_wizard_web/src/widget/sidebar_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bridge_wizard_web/src/pages/main_page.dart';
import 'package:bridge_wizard_web/src/data/round_entry_model.dart';

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
      child: Row(children: <Widget>[
        StreamBuilder(
            stream: Firestore.instance
                      .collection("Tournament")
                      .document(tournamentID)
                      .collection("Section")
                      .document(sectionID)
                      .collection("Table")
                      .orderBy("table_NO", descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                      List rev = snapshot.data.documents.reversed.toList();
                      return DataTable(
        columns: <DataColumn>[
          
          DataColumn(
            label: Text('Table'),
          ),
          DataColumn(
            label: Text('Status'),
          ),
        ],
        rows: <DataRow>[
          for (var table in rev) 
            DataRow(cells: [
            DataCell(Text(table["table_NO"])),
            if(table["status"]==1)DataCell(Icon(
            Icons.play_circle_filled,
            size: 24,
            color: Colors.green,
            ),
            ),
            if (table["status"]==0)DataCell(Icon(
            Icons.pause_circle_filled,
            size: 24,
            color: Colors.red,
            ),)
          ]),
        ],
      );
                    }}),
      ],)
    ),
  ),
  SizedBox( width: 20,),
  SizedBox(
    width: MediaQuery.of(context).size.width * 5 / 6,
  child:SingleChildScrollView(
    
    scrollDirection: Axis.vertical,
    child: FittedBox(
      child:Row(children: <Widget>[
        StreamBuilder(
                  stream: Firestore.instance
                      .collection("Tournament")
                      .document(tournamentID)
                      .collection("Section")
                      .document(sectionID)
                      .collection("Score")
                      .orderBy("table_NO", descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        List rev = snapshot.data.documents.reversed.toList();
                        List<RoundEntry> sections=[];
                        if (rev != null)
                        for (var section in rev){
                          sections.add(RoundEntry.fromDoc(section));
                        }
                        
  
                        return IntrinsicHeight(
                                child: DataTable(
                                sortAscending: true,
                                sortColumnIndex: 0,
                                columns: [
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
                                  )
      
                                ],
                                rows: [
                                  
                                  for (var section in sections)
                                  DataRow(
                                    cells: [
                                      DataCell(Text(section.table_NO)),
                                      DataCell(Text(section.round_NO)),
                                      DataCell(Text(section.team_NS)),
                                      DataCell(Text(section.team_EW)),
                                      DataCell(Text(section.board_NO)),
                                      DataCell(Text(section.declaler)),
                                      DataCell(Text(section.trump)),
                                      DataCell(Text(section.double_)),
                                      DataCell(Text(section.vulnerable)),
                                      DataCell(Text(section.score)),
                                    ],
                                  ),
                                  
                                ],
                              ),
                            );

                    ;

                    }}),
      ],) 
    ),
  ),
  
  )
              ]
              )
);
  }
  
}
_getRound(String table) async {
  RoundEntry round;
  List<RoundEntry> rounds=[];
   String messages = "Copy of message body below: \n";  
  Firestore.instance
   .collection("Tournament")
   .document(tournamentID)
    .collection("Section")
    .document(sectionID)
    .collection("Table")
    .document(table)
    .collection("Round")
   .snapshots()
     .listen((data) {
      data.documents.forEach((data) { round = RoundEntry.fromDoc(data);
      rounds.add(round);
      return rounds;
        });
       });
}




