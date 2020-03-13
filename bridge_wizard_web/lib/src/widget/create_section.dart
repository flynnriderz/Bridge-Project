import 'dart:html';

import 'package:flutter/material.dart';    
import 'package:flutter_form_builder/flutter_form_builder.dart';    
import 'package:intl/intl.dart';  
import 'package:flutter_web_dashboard/src/commons/theme.dart';


class CreateSection extends StatefulWidget {    
 @override    
 _CreateSection createState() => _CreateSection();    
}    
     
class _CreateSection extends State<CreateSection> {    
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
                     items: ['Pair', 'Team', 'Other']    
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
                     items: ['One', 'Two', 'Three']    
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
                     items: ['Michlle', 'Two', 'Three']    
                         .map((movement) => DropdownMenuItem(    
                             value: movement, child: Text("$movement")))    
                         .toList(),    
                   ),

                   FormBuilderDateTimePicker(    
                     attribute: "date",    
                     inputType: InputType.date,    
                     validators: [FormBuilderValidators.required()],    
                     format: DateFormat("dd-MM-yyyy"),    
                     decoration: InputDecoration(labelText: "Date of section"),    
                   ),    
                   
                  //  FormBuilderDropdown(    
                  //    attribute: "gender",    
                  //    decoration: InputDecoration(labelText: "Gender"),    
                  //    // initialValue: 'Male',    
                  //    hint: Text('Select Gender'),    
                  //    validators: [FormBuilderValidators.required()],    
                  //    items: ['Male', 'Female', 'Other']    
                  //        .map((gender) => DropdownMenuItem(    
                  //            value: gender, child: Text("$gender")))    
                  //        .toList(),    
                  //  ),    
                  //  FormBuilderTextField(    
                  //    attribute: "age",    
                  //    decoration: InputDecoration(labelText: "Age"),    
                  //    keyboardType: TextInputType.number,    
                  //    validators: [    
                  //      FormBuilderValidators.numeric(),    
                  //      FormBuilderValidators.max(70),    
                  //    ],    
                  //  ),    
                  //  FormBuilderSlider(    
                  //    attribute: "slider",    
                  //    validators: [FormBuilderValidators.min(6)],    
                  //    min: 0.0,    
                  //    max: 10.0,    
                  //    initialValue: 1.0,    
                  //    divisions: 20,    
                  //    decoration: InputDecoration(    
                  //        labelText: "Number of Family Members"),    
                  //  ),    
                  //  FormBuilderSegmentedControl(    
                  //    decoration: InputDecoration(labelText: "Rating"),    
                  //    attribute: "movie_rating",    
                  //    options: List.generate(5, (i) => i + 1)    
                  //        .map(    
                  //            (number) => FormBuilderFieldOption(value: number))    
                  //        .toList(),    
                  //  ),    
                  //  FormBuilderStepper(    
                  //    decoration: InputDecoration(labelText: "Stepper"),    
                  //    attribute: "stepper",    
                  //    initialValue: 10,    
                  //    step: 1,    
                  //  ),    
                  //  FormBuilderCheckboxList(    
                  //    decoration:    
                  //        InputDecoration(labelText: "Languages you know"),    
                  //    attribute: "languages",    
                  //    initialValue: ["English"],    
                  //    options: [    
                  //      FormBuilderFieldOption(value: "English"),    
                  //      FormBuilderFieldOption(value: "Hindi"),    
                  //      FormBuilderFieldOption(value: "Other")    
                  //    ],    
                  //  ),    
                  //  FormBuilderSignaturePad(    
                  //    decoration: InputDecoration(labelText: "Signature"),    
                  //    attribute: "signature",    
                  //    height: 100,    
                  //  ),    
                  //  FormBuilderRate(    
                  //    decoration: InputDecoration(labelText: "Rate this site"),    
                  //    attribute: "rate",    
                  //    iconSize: 32.0,    
                  //    initialValue: 1,    
                  //    max: 5,    
                  //  ),    
                  //  FormBuilderCheckbox(    
                  //    attribute: 'accept_terms',    
                  //    label: Text(    
                  //        "I have read and agree to the terms and conditions"),    
                  //    validators: [    
                  //      FormBuilderValidators.requiredTrue(    
                  //        errorText:    
                  //            "You must accept terms and conditions to continue",    
                  //      ),    
                  //    ],    
                  //  ),    
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
                      //  Navigator.push(context, MaterialPageRoute(
                      //   builder: (context)=> confirmCreate()));    
                      Navigator.pop(context);
                      Navigator.pop(context);
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