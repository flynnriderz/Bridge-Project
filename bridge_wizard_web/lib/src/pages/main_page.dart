import 'dart:html';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/src/commons/theme.dart';
import 'package:flutter_web_dashboard/src/widget/card_tile.dart';
import 'package:flutter_web_dashboard/src/widget/chart_card_tile.dart';
import 'package:flutter_web_dashboard/src/widget/comment_widget.dart';
import 'package:flutter_web_dashboard/src/widget/profile_Widget.dart';
import 'package:flutter_web_dashboard/src/widget/score_widget.dart';
import 'package:flutter_web_dashboard/src/widget/quick_contact.dart';
import 'package:flutter_web_dashboard/src/widget/responsive_widget.dart';
import 'package:flutter_web_dashboard/src/widget/score_widget.dart';
import 'package:flutter_web_dashboard/src/widget/sidebar_menu..dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_web_dashboard/src/widget/section.dart';




class MainPage extends StatelessWidget {
  int state=0;
  void chagestate(){
    
  }
  
  
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    print(_media);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
          return Material(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ResponsiveWidget.isLargeScreen(context)
                    ? SideBarMenu()
                    : Container(),
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 55,
                        width: _media.width,
                        child: AppBar(
                          elevation: 4,
                          centerTitle: true,
                          title: Text(
                            'Bridge Wizard',
                          ),
                          backgroundColor: drawerBgColor,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 20),
                          children: <Widget>[
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      IntrinsicHeight(
                                        child: Row(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                ChartCardTile(
                                                  cardColor: Colors.orange,
                                                  cardTitle: 'Tournament',
                                                  subText: '@ECC',
                                                  icon: Icons.history,
                                                  typeText: 'Tour 1',
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                ChartCardTile(
                                                  cardColor: Color(0xFF25C6DA),
                                                  cardTitle: 'Section',
                                                  subText: '@811',
                                                  icon: Icons.home,
                                                  typeText: 'Kmitl Free Time',
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                              height: 20,
                                            ),
                                      IntrinsicHeight(
                                        
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            RaisedButton(
                                            color: Color(0xff7560ED),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            onPressed: () => state=1,
                                            child: Text(
                                              '   Detail   ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                              ),
                                            ),
                                          ),
                                            SizedBox(width: 20),
                                            RaisedButton(
                                            color: Color(0xff7560ED),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            onPressed: () => Navigator.push(context, MaterialPageRoute(
                                              builder: (context)=> TabsNonScrollableDemo())),
                                            child: Text(
                                              '   Score    ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                              ),
                                            ),
                                          ),
                                            SizedBox(width: 20),
                                            RaisedButton(
                                            color: Color(0xff7560ED),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            onPressed: () => print('follow'),
                                            child: Text(
                                              ' Player List ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                              ),
                                            ),
                                          ),
                                            SizedBox(width: 20),
                                            RaisedButton(
                                            color: Color(0xff7560ED),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            onPressed: () => print('follow'),
                                            child: Text(
                                              '   Result   ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                              ),
                                            ),
                                          ),
                                            SizedBox(width: 20),
                                            RaisedButton(
                                            color: Color(0xff7560ED),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            onPressed: () => print('follow'),
                                            child: Text(
                                              '   Back   ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                              ),
                                            ),
                                          ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      IntrinsicHeight(
                                        child: Row(
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // children: <Widget>[
                                              //   ChartCardTile(
                                              //     cardColor: Color(0xFF7560ED),
                                              //     cardTitle: 'Bandwidth usage',
                                              //     subText: 'March 2017',
                                              //     icon: Icons.pie_chart,
                                              //     typeText: '50 GB',
                                              //   ),
                                              //   SizedBox(
                                              //     height: 20,
                                              //   ),
                                              //   ChartCardTile(
                                              //     cardColor: Color(0xFF25C6DA),
                                              //     cardTitle: 'Download count',
                                              //     subText: 'March 2017',
                                              //     icon: Icons.cloud_upload,
                                              //     typeText: '35487',
                                              //   ),
                                              // ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            if(state==0)                                
                                              ScoreWidget(media: _media)
                                              else if(state==1)
                                              ProfileWidget(media: _media)
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // QuickContact(media: _media)
                                ],
                              ),
                            ),
                            // IntrinsicHeight(
                            //   child: Row(
                            //     crossAxisAlignment: CrossAxisAlignment.stretch,
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children: <Widget>[
                            //       CommentWidget(media: _media),
                            //       SizedBox(
                            //         width: 20,
                            //       ),
                            //       ProfileWidget(media: _media),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        return Container();
      },
    );
  }
}

