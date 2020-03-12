// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/src/model/menu.dart';
import 'package:flutter_web_dashboard/src/widget/sidebar_menu..dart';
class TabsNonScrollableDemo extends StatefulWidget {
  @override
  _TabsNonScrollableDemo createState() => _TabsNonScrollableDemo();
}
class _TabsNonScrollableDemo extends State<TabsNonScrollableDemo>{

  @override
  Widget build(BuildContext context) {
    List<String> tabs = [
      'Detail','Score','Player list','Result'
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
            for (final tab in tabs)
              Center(
                child: Text(tab),
              ),
          ],
        ),
      ),
    );
  }
}

