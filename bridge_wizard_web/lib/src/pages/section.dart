
import 'package:flutter/material.dart';
import 'package:bridge_wizard_web/src/widget/result_widget.dart';
import 'package:bridge_wizard_web/src/widget/score_widget.dart';
import 'package:bridge_wizard_web/src/commons/theme.dart';
import 'package:bridge_wizard_web/src/widget/detail_widget.dart';
import 'package:bridge_wizard_web/src/widget/competitor/player_page.dart';
import 'package:bridge_wizard_web/src/pages/main_page.dart';

class TabsNonScrollableDemo extends StatefulWidget {
  @override
  _TabsNonScrollableDemo createState() => _TabsNonScrollableDemo();
}
class _TabsNonScrollableDemo extends State<TabsNonScrollableDemo>{


  @override
  Widget build(BuildContext context) {
    
    final _media = MediaQuery.of(context).size;
    List<String> tabs = [
      'Detail','Score','Player list'
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: drawerBgColor,
          automaticallyImplyLeading: true,
          title:
              Text(sectionname),
          bottom: TabBar(
            isScrollable: false,
            tabs: [
              for (final tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DetailPage(),
            ScoreWidget(media: _media),
            PlayerDetail(),
          ],
        ),
      ),
    );
  }
}

