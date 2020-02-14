import 'package:flutter/material.dart';

class Menu {
  String title;
  IconData icon;

  Menu({this.title, this.icon});
}

List<Menu> menuItems = [
  Menu(title: 'Tournament', icon: Icons.dashboard),
  Menu(title: 'Create Tournament', icon: Icons.create_new_folder),
];
