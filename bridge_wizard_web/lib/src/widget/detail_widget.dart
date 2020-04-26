import 'package:bridge_wizard_web/src/data/section_entry_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bridge_wizard_web/src/widget/sidebar_menu..dart';
import 'package:bridge_wizard_web/src/pages/main_page.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPage createState() {
    return _DetailPage();
  }
}

class _DetailPage extends State<DetailPage> {
   @override
  Widget build(BuildContext context) {
    List<String> names ;
    Firestore.instance
                      .collection("Tournament")
                      .document(tournamentID)
                      .collection("Section")
                      .document(sectionID)
                      .snapshots()
                      .forEach((f) => names = [
    'Section name                                              '+f.data.values.toList()[5],
    'Section type                                                      '+f.data.values.toList()[8],
    'Number of table                                                   '+f.data.values.toList()[6],
    'Board range                                                       '+f.data.values.toList()[0],
    'Boards per round                                                 '+f.data.values.toList()[1],
    'Movement                                                      '+f.data.values.toList()[3],
    'Time per round                                                 '+f.data.values.toList()[7],
    'Key                                                                   '+f.data.values.toList()[2],
    'Pin                                                                   '+f.data.values.toList()[4],
    ]); 
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
            child: SizedBox(
            width: MediaQuery.of(context).size.width * 1 / 3,
            child:StreamBuilder(
                  stream: Firestore.instance
                      .collection("Tournament")
                      .document(tournamentID)
                      .collection("Section")
                      .document(sectionID)
                      .collection("Competitor")
                      .snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
               return ListView.builder(
              itemCount: names.length,
              itemBuilder: (BuildContext context, int position) {
                List rev = snapshot.data.documents.reversed.toList();
                
                var name = names[position];
                return Card(margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                      child: ListTile(title: Text(name)),
                      
                  );
              }
              );
                    }})
          )
        ),
      )
    );
  }
}