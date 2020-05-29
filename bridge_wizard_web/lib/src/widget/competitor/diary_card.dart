import 'package:flutter/material.dart';
import 'package:bridge_wizard_web/src/data/diary_entry_model.dart';
import 'package:bridge_wizard_web/src/widget/competitor/pop_up_menu.dart';

class DiaryCard extends StatelessWidget {
  const DiaryCard({
    Key key,
    @required this.diaryEntry,
  }) : super(key: key);

  final DiaryEntry diaryEntry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 160,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightGreen.shade100,
                  ),
                  child: Center(
                    child: Text(
                      diaryEntry.team_NO.toString(),
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Team    "+
                                diaryEntry.team_name,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              PopUpMenu(diaryEntry: diaryEntry)
                            ],
                          ),
                         Divider(thickness: 1),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text("Player1    "+
                              diaryEntry.player1_name,
                              maxLines: 3,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(height: 1.75),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text("Player2    "+
                              diaryEntry.player2_name,
                              maxLines: 3,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(height: 1.75),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: InkWell(
                        
                        child: Text("Pin : "+
                          diaryEntry.pin,
                          style: TextStyle(
                            color: Colors.lightBlue.shade300,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
