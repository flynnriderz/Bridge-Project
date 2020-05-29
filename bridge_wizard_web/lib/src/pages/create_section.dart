import 'dart:html';
import 'dart:math';
import 'package:bridge_wizard_web/src/data/section_entry_model.dart';
import 'package:bridge_wizard_web/src/data/table_entry_model.dart';
import 'package:bridge_wizard_web/src/widget/sidebar_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';    
import 'package:flutter_form_builder/flutter_form_builder.dart';    
import 'package:bridge_wizard_web/src/data/round_entry_model.dart';
import 'package:bridge_wizard_web/src/data/key_entry_model.dart';
import 'package:bridge_wizard_web/src/commons/theme.dart';
import 'package:bridge_wizard_web/src/data/diary_entry_model.dart';


class CreateSection extends StatefulWidget {    
 @override    
 _CreateSection createState() => _CreateSection();    
}    
     
class _CreateSection extends State<CreateSection> {    
 bool autoValidate = true;    
 bool readOnly = false;    
 bool showSegmentedControl = true;    
 final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();   
     
 @override    
 Widget build(BuildContext context) {    
   return Scaffold(    
     appBar: AppBar(
       automaticallyImplyLeading: false, 
       backgroundColor: drawerBgColor,    
       title: Text("Create a section"),    
     ),    
     body: Padding(    
       padding: EdgeInsets.all(10),    
       child: SingleChildScrollView(    
         child: Column(    
           children: <Widget>[    
             FormBuilder(    
               key: _fbKey,    
               initialValue: {    
                 'date': DateTime.now(),    
                 'accept_terms': false,    
               },    
               autovalidate: true,    
               child: Column(    
                 children: <Widget>[    
                   FormBuilderTextField(   
                     attribute: 'Section',    
                     validators: [FormBuilderValidators.required()],    
                     
                     decoration: InputDecoration(labelText: "Section name"),    
                   ),    
                   FormBuilderDropdown(    
                     attribute: "type",    
                     decoration: InputDecoration(labelText: "Section type"),    
                     // initialValue: 'Male',    
                     hint: Text('Select type'),    
                     validators: [FormBuilderValidators.required()],    
                     items: ['Pair',]    
                         .map((type) => DropdownMenuItem(    
                             value: type, child: Text("$type")))    
                         .toList(),    
                   ),

                   FormBuilderTextField(   
                     
                     attribute: 'table',    
                     validators: [FormBuilderValidators.required()],
                     
                     decoration: InputDecoration(labelText: "Number of table"),    
                   ),

                   FormBuilderTextField(    
                     attribute: 'board',    
                     validators: [FormBuilderValidators.required()],
                     
                     decoration: InputDecoration(labelText: "Board range"),    
                   ), 

                   FormBuilderDropdown(    
                     attribute: "round",    
                     decoration: InputDecoration(labelText: "Boards per round"),    
                     // initialValue: 'Male',    
                     hint: Text('Select boards per round'),    
                     validators: [FormBuilderValidators.required()],    
                     items: ['1',]    
                         .map((round) => DropdownMenuItem(    
                             value: round, child: Text("$round")))    
                         .toList(),    
                   ),  

                    FormBuilderDropdown(    
                     attribute: "movement",    
                     decoration: InputDecoration(labelText: "Movement"),    
                     // initialValue: 'Male',    
                     hint: Text('Select movement'),    
                     validators: [FormBuilderValidators.required()],    
                     items: ['Michlle',]    
                         .map((movement) => DropdownMenuItem(    
                             value: movement, child: Text("$movement")))    
                         .toList(),    
                   ),
                 ],    
               ),    
             ),    
             Row(    
               children: <Widget>[  
                 RaisedButton(    
                   child: Text("Cancle"),    
                   onPressed: () {    
                     Navigator.pop(context);     
                   },    
                 ),  
                 SizedBox( 
                    width: 20, 
                 ),  
                 RaisedButton(    
                   child: Text("Create section"),    
                   onPressed: () async {    
                     _fbKey.currentState.save();    
                      var section = _fbKey.currentState.value.values.toList();
                      var rng = new Random();
                     if (_fbKey.currentState.validate()) { 
                        final data = SectionEntry(
                        board : section[5],
                        board_round : section[6],
                        movement : section[7],
                        key : rng.nextInt(9999).toString(),
                        pin : rng.nextInt(9999).toString(),
                        section_name : section[2],
                        table : section[4],
                        time : "20",
                        type : section[3],
                        documentId : section[2],
                      ).toMap();

                       DocumentReference docRef =  await Firestore.instance
                       .collection('Tournament')
                       .document(tournamentID)
                       .collection('Section')
                       .add(data);
                      _createTable(section[4],section[5],docRef);
                       print(_fbKey.currentState.value);
                      //  Navigator.push(context, MaterialPageRoute(
                      //   builder: (context)=> confirmCreate()));    
                      Navigator.pop(context);
                     }   
                     else print(_fbKey.currentState.value); 
                   },    
                 ),      
               ],    
             )    
           ],    
         ),    
       ),    
     ),    
   );    
 }    
}    

void _createTable(String table,String board,DocumentReference docRef) {


  final _enteredTable = int.parse(table);
  final _enteredBoard = int.parse(board);

  List _boardPlay = new List();
  List _competition = new List();

  int _boardPerTable = (_enteredBoard / _enteredTable).round();
  int _totalPlayingBoard = _enteredTable * _boardPerTable;

  if (_enteredTable <= 0 || _enteredBoard <= 0) {
    return;
  }

  //do something
  print('Board/Table: $_boardPerTable');
  print('Total Board: $_totalPlayingBoard');
  _boardPlay = _createBoardList(_boardPerTable, _enteredTable);
  _competition = _compititionCreate(_enteredTable);
  print('Board: $_boardPlay');
  printCompetition(_competition);
  print('');
  _addNewMatching(_boardPlay, _competition, _enteredTable,docRef);
  //print('');
}

List _createBoardList(int bpt, int totalTable) {
  List boardAmount = List.generate(
      totalTable, (i) => List.generate(bpt, (j) => bpt * i + j + 1));
  return boardAmount;
}

int _adjustNumber(int number, int totalTable) {
  if (number < 1) {
    return _adjustNumber(number + totalTable, totalTable);
  } else if (number > totalTable) {
    return _adjustNumber(number - totalTable, totalTable);
  } else {
    return number;
  }
}

List _compititionCreate(int totalTable) {
  bool isEvenTables = (totalTable % 2 == 0) ? true : false;
  int skipRound = totalTable ~/ 2;

  List competitions = List.generate(
      totalTable,
      (i) => List.generate(
          totalTable,
          (j) => [
                _adjustNumber(
                    (1 + j - i) + (isEvenTables && i >= skipRound ? 1 : 0),
                    totalTable),
                _adjustNumber(
                    (1 + j - 2 * i) + (isEvenTables && i >= skipRound ? 1 : 0),
                    totalTable)
              ]));

  if (isEvenTables) {
    competitions.removeAt(totalTable ~/ 2);
  }
  return competitions;
}

void printCompetition(List competition) {
  for (var j = 0; j < competition.length; j++) {
    print('${j + 1}:  ${competition[j]}');
  }
}

void _addNewMatching(List board, List competition, int totalTable,DocumentReference docRef) async {
  int totalRound = board.length;
  //int currentId = 0;

  // for (var i = 1; i <= int.parse(section[4]); i++) {
//                           final table = TableEntry(
//                                   table_NO : i.toString(),
//                                   status : "",
//                                   next_table : (i+1).toString(),
//                                 ).toMap();
//                                 DocumentReference tableRef =  await Firestore.instance
//                                 .collection('Tournament')
//                                 .document(tournamentID)
//                                 .collection('Section')
//                                 .document(docRef.documentID)
//                                 .collection("Table")
//                                 .add(table);
//                                   for (var j = 1; j <= int.parse('5'); j++) {
//                                     final round = RoundEntry(
//                                   team_EW : "",
//                                   board_NO: j.toString(),
//                                   round_NO: j.toString(),
//                                   team_NS: "",
//                                   declaler: "",
//                                   trump: "",
//                                   double_ : "",
//                                   vulnerable : "",
//                                   score : "",
//                                 ).toMap();

//                                 Firestore.instance
//                                 .collection('Tournament')
//                                 .document(tournamentID)
//                                 .collection('Section')
//                                 .document(docRef.documentID)
//                                 .collection("Table")
//                                 .document(tableRef.documentID)
//                                 .collection("Round")
//                                 .add(round);
//                                 }
//                        }
  var rng = new Random();
  for (var i = 0; i < competition.length ; i++) {
    for (var j = 0; j < 2 ; j++) {
    final data = DiaryEntry(
          team_NO : (i+1+j*totalTable),
          pin: rng.nextInt(9999).toString(),
          player1_name: "",
          player2_name: "",
          team_name: "",
        ).toMap();
        Firestore.instance.collection("Tournament")
        .document(tournamentID)
        .collection("Section")
        .document(docRef.documentID)
        .collection("Competitor").add(data);
    }
    var key = rng.nextInt(999999);
    final table = TableEntry(
                                status : 0,
                                key : key.toString(),
                                  table_NO : (i+1).toString(),
                                ).toMap();
                                DocumentReference roundRef =  await Firestore.instance
                                .collection('Tournament')
                                .document(tournamentID)
                                .collection('Section')
                                .document(docRef.documentID)
                                .collection("Table")
                                .add(table);
    final regkey = KeyEntry(
                                key : key.toString(),
                                  table : roundRef,
    ).toMap();
     Firestore.instance
                                .collection('Tournament')
                                .document(tournamentID)
                                .collection('Section')
                                .document(docRef.documentID)
                                .collection("Key")
                                .add(regkey);
    for (var j = 0; j < totalRound; j++) {
      print(
          'Table:${i+1}\tRound: ${j+1}\tBoard: ${board[(i+j)%totalRound]}\t\tNS: ${(i+j)%totalRound+1}\tEW: ${competition[i][(i+j)%totalRound][1] + totalTable}'); //correct
      // currentId++;
      // _matchCompetition.add(Match(
      //   id: currentId,
      //   round: i + 1,
      //   table: competition[i][j][0],
      //   boards: board[j],
      //   teamNS: competition[i][j][0],
      //   teamEW: competition[i][j][1] + totalTable,
      // ));

                                    final table = RoundEntry(
                                  round_NO: (j+1).toString(),
                                  team_EW :(competition[i][(i+j)%totalRound][1] + totalTable).toString(),
                                  board_NO: board[(i+j)%totalRound],
                                  table_NO: (i+1).toString(),
                                  team_NS: ((i+j)%totalRound+1).toString(),
                                  declaler: "",
                                  trump: "",
                                  double_ : "",
                                  vulnerable : "",
                                  score : "",
                                ).toMap();

                                Firestore.instance
                                .collection('Tournament')
                                .document(tournamentID)
                                .collection('Section')
                                .document(docRef.documentID)
                                .collection("Table")
                                .document(roundRef.documentID)
                                .collection("Round")
                                .add(table);

                                Firestore.instance
                                .collection('Tournament')
                                .document(tournamentID)
                                .collection('Section')
                                .document(docRef.documentID)
                                .collection("Score")
                                .add(table);
                                
    }
    
    print('');
  }
}