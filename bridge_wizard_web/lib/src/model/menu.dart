import 'package:flutter/material.dart';
import 'section.dart';

class Menu {
  String title;
  String location;
  IconData icon; 
  Section section;

  Menu({this.title, this.icon,this.location,this.section});
}

List<Menu> menuItems = [
  Menu(title: 'Tournament', icon: Icons.dashboard,location: 'ECC:801',section:sections[0]),
];

