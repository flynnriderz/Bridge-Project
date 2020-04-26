import 'package:flutter/material.dart';
import 'package:bridge_wizard_web/src/competitor/diary_entry_model.dart';
import 'package:bridge_wizard_web/src/competitor/diary_entry_button.dart';
import 'package:bridge_wizard_web/src/competitor/emoji_helpers.dart';


class DiaryEntryPage extends StatefulWidget {
  const DiaryEntryPage({
    Key key,
    this.diaryAction,
    this.diaryEntry,
  }) : super(key: key);

  const DiaryEntryPage.edit(
      {Key key, this.diaryAction = DiaryAction.edit, this.diaryEntry})
      : super(key: key);

  const DiaryEntryPage.add(
      {Key key, this.diaryAction = DiaryAction.add, this.diaryEntry})
      : super(key: key);

  const DiaryEntryPage.read(
      {Key key, this.diaryAction = DiaryAction.read, this.diaryEntry})
      : super(key: key);

  final DiaryEntry diaryEntry;

  final DiaryAction diaryAction;
  @override
  _DiaryEntryPageState createState() => _DiaryEntryPageState();
}

class _DiaryEntryPageState extends State<DiaryEntryPage> {
  String _emoji;
  TextEditingController numberTextController;
  TextEditingController teamTextController;
  TextEditingController player1TextController;
  TextEditingController player2TextController;
  bool isReadOnly;
  @override
  void initState() {
    _emoji = widget.diaryEntry?.team_NO ?? '';
    numberTextController =
        TextEditingController(text: widget.diaryEntry?.team_NO ?? '');
    teamTextController =
        TextEditingController(text: widget.diaryEntry?.team_name ?? '');
    player1TextController =
        TextEditingController(text: widget.diaryEntry?.player1_name ?? '');
    player2TextController =
        TextEditingController(text: widget.diaryEntry?.player2_name ?? '');
    isReadOnly = widget.diaryAction == DiaryAction.read;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 3 / 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Title
                TextField(
                  readOnly: isReadOnly,
                  controller: numberTextController,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Colors.black87),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: isReadOnly ? '' : 'Team number',
                  ),
                ),
                
                // Title
                TextField(
                  readOnly: isReadOnly,
                  controller: teamTextController,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Colors.black87),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: isReadOnly ? '' : 'Team name',
                  ),
                ),
                // Body text
                TextField(
                  readOnly: isReadOnly,
                  controller: player1TextController,
                  maxLines: null,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.black87, height: 1.7),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Player 1 name-surname',
                    border: InputBorder.none,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.grey.shade400),
                  ),
                ),
                // Body text
                TextField(
                  readOnly: isReadOnly,
                  controller: player2TextController,
                  maxLines: null,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.black87, height: 1.7),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Player 2 name-surname',
                    border: InputBorder.none,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.grey.shade400),
                  ),
                ),
                SizedBox(height: 100)
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isReadOnly
          ? SizedBox()
          : DiaryEntryButton(
              numberTextController: numberTextController,
              teamTextController: teamTextController,
              player1TextController: player1TextController,
              player2TextController: player2TextController,
              widget: widget,
            ),
    );
  }

  @override
  void dispose() {
    numberTextController.dispose();
    teamTextController.dispose();
    player1TextController.dispose();
    player2TextController.dispose();
    super.dispose();
  }
}

enum DiaryAction { edit, add, read }
