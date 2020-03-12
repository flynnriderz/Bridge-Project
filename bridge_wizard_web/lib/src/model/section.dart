import 'package:flutter/material.dart';

class Section {
  String title;
  String type;
  IconData icon;

  Section({this.title, this.icon,this.type});
}

List<Section> sections = [
  Section(title: 'Section', icon: Icons.dashboard,type: 'Pair'),
];
