class MenuItem {
  final String name;
  bool isSpecialItem;

  MenuItem(this.name, {this.isSpecialItem = false});

  static List<MenuItem> all() => [
    MenuItem("Home"),
    MenuItem("About"),
    MenuItem("Sign up",isSpecialItem: true),
    MenuItem("Log in", isSpecialItem: true)
  ];
}