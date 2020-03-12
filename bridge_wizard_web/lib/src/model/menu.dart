import 'package:flutter/material.dart';

class Menu {
  String title;
  String location;
  IconData icon;

  Menu({this.title, this.icon,this.location});
}

List<Menu> menuItems = [
  Menu(title: 'Tournament', icon: Icons.dashboard,location: 'ECC:801'),
];
