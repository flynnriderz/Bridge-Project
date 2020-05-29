import 'package:flutter/material.dart';

import '../../methods/calculator.dart';
import 'contract_editor.dart';
import 'declarer_editor.dart';
import 'double_editor.dart';
import 'made_editor.dart';
import 'trump_editor.dart';

class ScoreEditor extends StatefulWidget {
  final Calculator recentCalculator;
  ScoreEditor(this.recentCalculator);

  @override
  _ScoreEditorState createState() => _ScoreEditorState();
}

class _ScoreEditorState extends State<ScoreEditor> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: <Widget>[
            DeclarerEditor(widget.recentCalculator),
            ContractEditor(widget.recentCalculator),
            TrumpEditor(widget.recentCalculator),
            DoubleEditor(widget.recentCalculator),
            MadeEditor(widget.recentCalculator),
          ],
        ),
    );
  }
}
