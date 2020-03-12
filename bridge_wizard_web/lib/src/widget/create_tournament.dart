import 'package:flutter/material.dart';    
import 'package:flutter_form_builder/flutter_form_builder.dart';    
import 'package:flutter_web_dashboard/src/model/menu.dart';
import 'package:flutter_web_dashboard/src/widget/sidebar_menu..dart';

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
       title: Text("Flutter Form Validation"),    
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
                     attribute: 'Tournament_name',    
                     validators: [FormBuilderValidators.required()],    
                     decoration: InputDecoration(labelText: "Tournament name"),    
                   ),    
                   FormBuilderTextField(    
                     attribute: "Location",      
                     validators: [FormBuilderValidators.required()],    
                     decoration: InputDecoration(labelText: "Location"),    
                   ),  
                     ],    
               ),    
             ),    
             Row(    
               children: <Widget>[    
                 MaterialButton(    
                   child: Text("Submit"),    
                   onPressed: () {    
                     _fbKey.currentState.save();    
                     if (_fbKey.currentState.validate()) {    
                        print(_fbKey.currentState.value);
                      //  print(_fbKey.currentState.value.values.toList()[2]);    
                      //  print(_fbKey.currentState.value.values.toList()[3]); 
                      menuItems.addAll([
                      Menu(title: _fbKey.currentState.value.values.toList()[2], 
                      icon: Icons.dashboard,
                      location: _fbKey.currentState.value.values.toList()[3]),
                      ]);
                     }    
                   },    
                 ),    
                 MaterialButton(    
                   child: Text("Reset"),    
                   onPressed: () {    
                     _fbKey.currentState.reset();    
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