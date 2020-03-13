// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/src/model/menu.dart';
import 'package:flutter_web_dashboard/src/widget/sidebar_menu..dart';
import 'package:flutter_web_dashboard/src/widget/profile_Widget.dart';
import 'package:flutter_web_dashboard/src/widget/score_widget.dart';
import 'package:flutter_web_dashboard/src/commons/theme.dart';

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
              Text(menuItems[selectedIndex].section.title),
          bottom: TabBar(
            isScrollable: false,
            tabs: [
              for (final tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProfileWidget(media: _media),
            ScoreWidget(media: _media,),
            ProfileWidget(media: _media),
            ScoreWidget(media: _media,),
          ],
        ),
      ),
    );
  }
}

