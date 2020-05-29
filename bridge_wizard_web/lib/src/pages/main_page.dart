import 'dart:html';


import 'package:bridge_wizard_web/src/data/round_entry_model.dart';
import 'package:bridge_wizard_web/src/data/score_entry_model.dart';
import 'package:bridge_wizard_web/src/pages/create_section.dart';
import 'package:bridge_wizard_web/src/data/tournament_entry_model.dart';
import 'package:bridge_wizard_web/src/data/section_entry_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bridge_wizard_web/src/commons/theme.dart';
import 'package:bridge_wizard_web/src/widget/chart_card_tile.dart';
import 'package:bridge_wizard_web/src/widget/responsive_widget.dart';
import 'package:bridge_wizard_web/src/widget/sidebar_menu.dart';
import 'package:bridge_wizard_web/src/pages/section.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as db ;


String sectionID="";
String sectionname="";
int state=0;
class MainPage extends StatefulWidget { 
 @override   
  
 _MainPage createState() => _MainPage();    
}    

class _MainPage extends State<MainPage>  {       
     
 @override    
  Widget build(BuildContext context)  {
    List b=[];
    String messages = "Copy of message body below: \n"; 
    _getAllMessages() async {
   db.Firestore.instance
   .collection('/Tournament')
   .snapshots()
    .listen((data) =>
        data.documents.forEach((doc) =>
        messages+"1"));
  }
  
  _getAllMessages();
  
  print(messages);
  //   _getAllMessages() async {
        
  //  String messages = "Copy of message body below: \n";  
  // db.Firestore.instance
  //   .collection('/Tournament')
  //   .snapshots()
  //   .listen((data) =>
  //       data.documents.forEach((doc) =>
  //       b.add(1)));
  // }
    
    final _media = MediaQuery.of(context).size;
    
    return  LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
          return Material(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ResponsiveWidget.isLargeScreen(context)
                    ? SideBarMenu()
                    : Container(),
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 55,
                        width: _media.width,
                        child: AppBar(
                          automaticallyImplyLeading: false,
                          elevation: 4,
                          centerTitle: true,
                          title: Text(
                            'Bridge Wizard',
                          ),
                          backgroundColor: drawerBgColor,
                        ),
                      ),
                      Expanded(
                        child: StreamBuilder(
                  stream: db.Firestore.instance
                      .collection("Tournament").snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        List rev = snapshot.data.documents.reversed.toList();
                        TournamentEntry tournament = TournamentEntry.fromDoc(rev[selectedIndex]);
                        return ListView(
                          padding: EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 20),
                          children: <Widget>[
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  if(tournamentID!="")Column(
                                    children: <Widget>[
                                      IntrinsicHeight(
                                        child: Row(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                ChartCardTile(
                                                  
                                                  cardColor: Colors.orange,
                                                  cardTitle: "Tournament  "+tournament.name,
                                                  subText: 'Director  '+tournament.director_name,
                                                  icon: Icons.accessibility_new,
                                                  typeText: "Location  "+tournament.location,
                                                ),
                                              ],
                                            ),
                                            
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // QuickContact(media: _media)
                                ],
                              ),
                            ),

                          if(tournamentID!="") StreamBuilder(
                  stream: db.Firestore.instance
                      .collection("Tournament").document(tournamentID).collection("Section").snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        List rev = snapshot.data.documents.reversed.toList();
                        List<SectionEntry> sections=[];
                        if (rev != null)
                        for (var section in rev){
                          sections.add(SectionEntry.fromDoc(section));
                        }
                        
                        return IntrinsicHeight(
                                child: DataTable(
                                sortAscending: true,
                                
                                columns: [
                                  
                                  DataColumn(
                                    
                                      label: Text(
                                        "Section",
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.w900),
                                      ),
                                      
                                      ),
                                      
                                  DataColumn(
                                      label: Text(
                                    "Type",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                                  )),
                                  DataColumn(
                                    label: Text("DELETE",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                                  )
                                ],
                                rows: [
                                  
                                  for (var section in sections)
                                  DataRow(
                                    cells: [
                                      DataCell(Text(section.section_name), showEditIcon: false,onTap: () {
                                        sectionname=section.section_name;
                              sectionID=section.documentId;
                              
                              
                              Navigator.push(context, MaterialPageRoute(
                                              builder: (context)=> TabsNonScrollableDemo()));
                            }),
                                      DataCell(Text(section.type),onTap: () {
                                        sectionname=section.section_name;
                              sectionID=section.documentId;
                              Navigator.push(context, MaterialPageRoute(
                                              builder: (context)=> TabsNonScrollableDemo()));
                            }),
                            DataCell(IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                sectionname=section.section_name;
                                  sectionID=section.documentId;
                                  _asyncConfirmDialog(context);
                              },
                            ))
                                    ],
                                  ),
                                  
                                ],
                              ),
                            );

                    }})
                          ],

                        )
                        ;
                    }}
                      ),)
                      ,
                      if(tournamentID!="")Center(child: FloatingActionButton(
        elevation: 1.5,
        onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> CreateSection())),
        tooltip: 'Create Section',
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.secondary),)
      
                    ],
                  ),
                ),
              ],
            ),
          );
        return Container();
      },
    );
  }
}
enum ConfirmAction { CANCEL, ACCEPT }

Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Do you want to delete '+sectionname+'?'),
        content: const Text(
            'This will delete all data in your section.'),
        actions: <Widget>[
          FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: const Text('ACCEPT'),
            onPressed: () {
              db.Firestore.instance
                  .collection("Tournament")
                  .document(tournamentID)
                  .collection("Section")
                  .document(sectionID)
                  .delete();
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          )
        ],
      );
    },
  );
}
  