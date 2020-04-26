import 'package:flutter/material.dart';

import './display/contract_display.dart';
import './display/made_display.dart';

// import './score_editor/contract_editor.dart';
// import './score_editor/made_editor.dart';

class Summary extends StatefulWidget {
  
  //int _contract;
  int _made;

  // set contracts(int contract){
  //   this._contract = contract;
  //   this._contract = contract;
  // }
  
  set mades(int made){
    this._made = made;
  }

  @override
  _SummaryState createState() => _SummaryState(_made);
}

class _SummaryState extends State<Summary> {
  final int totalMade;
  _SummaryState(this.totalMade);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContractDisplay(),
        MadeDisplay(totalMade),
      ],
    );
  }
}
