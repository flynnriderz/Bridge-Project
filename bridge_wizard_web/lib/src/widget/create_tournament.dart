
import 'package:bridge_wizard_web/src/data/tournament_entry_model.dart'; 
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:flutter/material.dart';     
import 'package:flutter_form_builder/flutter_form_builder.dart';     
import 'package:bridge_wizard_web/src/model/menu.dart'; 
import 'package:bridge_wizard_web/src/model/section.dart'; 
import 'package:bridge_wizard_web/src/commons/theme.dart'; 
import 'package:bridge_wizard_web/src/widget/create_section.dart'; 
import 'package:bridge_wizard_web/src/widget/responsive_widget.dart'; 
import 'package:bridge_wizard_web/src/pages/main_page.dart'; 
import 'package:bridge_wizard_web/src/widget/sidebar_menu..dart'; 
 
class CreateTournament extends StatefulWidget {     
 @override     
 _CreateTournament createState() => _CreateTournament();     
}     
      
class _CreateTournament extends State<CreateTournament> {     
 var data;     
 bool autoValidate = true;     
 bool readOnly = false;     
 bool showSegmentedControl = true;     
 final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();     
 @override     
 Widget build(BuildContext context) {     
   return Scaffold(     
     appBar: AppBar(   
        backgroundColor: drawerBgColor, 
        automaticallyImplyLeading: false, 
       title: Text("Create Tournament"),     
     ),     
     body: Padding(     
       padding: EdgeInsets.all(10),     
       child: SingleChildScrollView(     
         child: Column(     
           crossAxisAlignment: CrossAxisAlignment.center, 
           mainAxisAlignment: MainAxisAlignment.center, 
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
                     style: TextStyle( 
                              fontSize: ResponsiveWidget.isLargeScreen(context) 
                                  ? 26 
                                  : 18, 
                              color: Colors.black, 
                            ), 
                     attribute: 'Tournament_name',     
                     validators: [FormBuilderValidators.required()],     
                     decoration: InputDecoration(labelText: "Tournament name"),     
                   ),     
                   FormBuilderTextField( 
                     style: TextStyle( 
                              fontSize: ResponsiveWidget.isLargeScreen(context) 
                                  ? 26 
                                  : 18, 
                              color: Colors.black, 
                            ),     
                     attribute: "Location",       
                     validators: [FormBuilderValidators.required()],     
                     decoration: InputDecoration(labelText: "Location"),     
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
                   onPressed: () {     
                     _fbKey.currentState.save();     
                     if (_fbKey.currentState.validate()) {     
                        print(_fbKey.currentState.value); 
                      //  print(_fbKey.currentState.value.values.toList()[2]);     
                      //  print(_fbKey.currentState.value.values.toList()[3]);  
 
                      final data = TournamentEntry( 
                        director_name: 'admin', 
                        name : _fbKey.currentState.value.values.toList()[2], 
                        location: _fbKey.currentState.value.values.toList()[3], 
                      ).toMap(); 
                      Firestore.instance.collection("/Tournament").add(data); 
                      Navigator.pop(context); 
                     }  }
                 ),
                ] )
               ]
         )))
         );}}