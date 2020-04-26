// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:bridge_wizard_web/src/model/menu.dart';
import 'package:bridge_wizard_web/src/widget/sidebar_menu..dart';
import 'package:bridge_wizard_web/src/widget/result_widget.dart';
import 'package:bridge_wizard_web/src/widget/score_widget.dart';
import 'package:bridge_wizard_web/src/commons/theme.dart';
import 'package:bridge_wizard_web/src/widget/detail_widget.dart';
import 'package:bridge_wizard_web/src/competitor/player_page.dart';
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
      'Detail','Score','Player list','Result'
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
            ScoreWidget(media: _media,),
            PlayerDetail(),
            ResultPage(),
          ],
        ),
      ),
    );
  }
}

