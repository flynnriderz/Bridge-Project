import 'dart:async';

import '../dummy_data/round_dummy_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../screens/tables_screen.dart';
import '../models/table.dart';

String section = "";
class MainMenuScreen extends StatelessWidget {
  final _keyController = TextEditingController();

  //static const routeName = '/main-menu';

  void _submitKey(BuildContext context) {
    if (_keyController.text.isEmpty) {
      return;
    }
    
    final enteredKey = _keyController.text;
    dummyTable=[];
    List<DocumentSnapshot> snapshots;
    Future readTable(String section) async{
      Firestore.instance.document(section).collection("Table").orderBy("table_NO",descending: false).snapshots().listen((data) async {
        snapshots = data.documents;
        for(var snapshot in snapshots){
             dummyTable.add(Tables(
                //collection
                round: [],
                //field
                key: snapshot.data['key'],
                table_NO: snapshot.data['table_NO'],
                status: snapshot.data['status']
              ),);
              print(snapshot.data['key']);
        }
        Navigator.of(context).pushNamed(
            TablesScreen.routeName,
          );
      });
    }
    Future readFirestore(String key) async{
      Firestore.instance.collection("Director").snapshots().listen((data) async {
        snapshots = data.documents;
        for(var snapshot in snapshots){
          if(snapshot.data['key']==key){
            print(snapshot.data['table_ref'].path);
            section=snapshot.data['table_ref'].path;
             readTable(section);
          }
        }
      });
    }
    
    ////ตรงนี้เอา key เช็คว่าตรงกับ tournament หรือ section ไหน////
    readFirestore(enteredKey);
    print('key: ' + enteredKey);
  }

  void _startSubmitKey(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: SingleChildScrollView(
            child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      maxLength: 6,
                      cursorColor: Theme.of(context).primaryColor,
                      cursorWidth: 3,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Key',
                      ),
                      controller: _keyController,
                      onSubmitted: (_) => _submitKey(context),
                    ),
                    RaisedButton(
                      child: const Text('Enter Key'),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () => _submitKey(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bridge Wizard'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                height: 300,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              RaisedButton(
                child: const Text('SUBMIT KEY'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () => _startSubmitKey(context),
              ),
            ],
          ),
        ));
  }
}
