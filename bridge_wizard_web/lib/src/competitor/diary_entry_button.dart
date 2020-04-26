import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bridge_wizard_web/src/competitor/diary_entry_model.dart';
import 'package:bridge_wizard_web/src/competitor/diary_entry_page.dart';
import 'package:bridge_wizard_web/src/pages/main_page.dart';
import 'package:bridge_wizard_web/src/widget/sidebar_menu..dart';
import 'dart:math';

class DiaryEntryButton extends StatelessWidget {
  const DiaryEntryButton({
    Key key,
    @required this.numberTextController,
    @required this.teamTextController,
    @required this.player1TextController,
    @required this.player2TextController,
    @required this.widget,
  })  : 
        super(key: key);
  final TextEditingController numberTextController;
  final TextEditingController teamTextController;
  final TextEditingController player1TextController;
  final TextEditingController player2TextController;
  final DiaryEntryPage widget;

  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    
    final isAddAction = widget.diaryAction == DiaryAction.add;
    return FloatingActionButton.extended(
      elevation: 2,
      onPressed: () {
        final data = DiaryEntry(
          team_name: teamTextController.text,
          team_NO : numberTextController.text,
          pin: rng.nextInt(9999).toString(),
          player1_name: player1TextController.text,
          player2_name: player2TextController.text,
        ).toMap();

        if (isAddAction) {
          // TODO: 1. Answer to add firestore document
          Firestore.instance.collection("Tournament")
        .document(tournamentID)
        .collection("Section")
        .document(sectionID)
        .collection("Competitor").add(data);
  
        } else if (widget.diaryAction == DiaryAction.edit) {
          // TODO: 4. Answer to update firestore document
          final documentId = widget.diaryEntry.documentId;
          Firestore.instance
              .collection("Tournament")
              .document(tournamentID)
              .collection("Section")
              .document(sectionID)
              .collection("Competitor")
              .document(documentId)
              .updateData(data);
        }
        Navigator.of(context).popUntil(ModalRoute.withName('/'));
      },
      label: Text(isAddAction ? 'Submit' : 'Update'),
      icon: Icon(isAddAction ? Icons.book : Icons.bookmark_border),
    );
  }
}
