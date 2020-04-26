import 'package:bridge_wizard_web/src/competitor/player_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bridge_wizard_web/src/competitor/diary_entry_model.dart';
import 'package:bridge_wizard_web/src/competitor/diary_entry_page.dart';
import 'package:bridge_wizard_web/src/pages/main_page.dart';
import 'package:bridge_wizard_web/src/widget/sidebar_menu..dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({
    Key key,
    this.diaryEntry
  }) : super(key: key);
  final DiaryEntry diaryEntry;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Action>(
      elevation: 2,
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: Action.delete,
            child: Text('Delete'),
          ),
          PopupMenuItem(
            value: Action.edit,
            child: Text('Edit'),
          ),
        ];
      },
      onSelected: (action) {
        switch (action) {
          case Action.delete:
            _showDeleteDialog(context, onDelete: () {
              // TODO: Answer 5 to delete a document
              Firestore.instance
                  .collection("Tournament")
                  .document(tournamentID)
                  .collection("Section")
                  .document(sectionID)
                  .collection("Competitor")
                  .document(diaryEntry.documentId)
                  .delete();
               Navigator.of(context, rootNavigator: true).pop();
            });
            break;
          case Action.edit:
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return DiaryEntryPage.edit(
                    diaryEntry: diaryEntry,
                  );
                },
              ),
            );
            break;

          default:
        }
      },
    );
  }
}

enum Action { delete, edit, none }

 _showDeleteDialog(BuildContext context, {Function onDelete}) {
  showDialog(
    context: context,
    child: AlertDialog(
      title: Text('Are you sure you want to delete?'),
      content: Text('Deleted entries are permanent and not retrievable.'),
      actions: <Widget>[
        FlatButton(
          color: Colors.redAccent,
          onPressed: onDelete,
          child: Text('Delete'),
        )
      ],
    ),
  );
}
