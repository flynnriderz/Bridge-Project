import 'package:flutter/material.dart';
import 'package:bridge_wizard_web/src/widget/responsive_widget.dart';
import 'package:bridge_wizard_web/src/widget/sidebar_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bridge_wizard_web/src/pages/main_page.dart';

class ChartCardTile extends StatelessWidget {
  final Color cardColor;
  final String cardTitle;
  final String subText;
  final IconData icon;
  final String typeText;

  const ChartCardTile(
      {Key key,
      this.cardColor,
      this.cardTitle,
      this.subText,
      this.icon,
      this.typeText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(4),
      shadowColor: Colors.grey,
      color: cardColor,
      child: Stack(
        children: <Widget>[
          Container(
            padding:
                _media.width >= 1280 ? EdgeInsets.all(15) : EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: cardColor,
            ),
            height: _media.height / 4,
            width: _media.width /2+300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      
                      icon, 
                      size: 50, 
                      color: Colors.white),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FittedBox(
                          child: Text(
                            cardTitle,
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: ResponsiveWidget.isLargeScreen(context)
                                  ? 26
                                  : 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(subText,
                            style:
                                TextStyle(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                    SizedBox(width: 500,),
                                Center(child: IconButton(
                                  icon: Icon(Icons.delete_forever),
                                  tooltip: 'Delete tournament',
                                  iconSize: 60,
                                  onPressed: (){_asyncConfirmDialog(context);},

                                ))
                  ],
                ),
                Spacer(),
                Text(
                  typeText,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
enum ConfirmAction { CANCEL, ACCEPT }

Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Do you want to delete tournament?'),
        content: const Text(
            'This will delete all data in your tournament.'),
        actions: <Widget>[
          FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: const Text('ACCEPT'),
            onPressed: () {
              Firestore.instance
                  .collection("Tournament")
                  .document(tournamentID)
                  .delete();
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
              Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(
                                              builder: (context)=> MainPage()));
            },
          )
        ],
      );
    },
  );
}
  