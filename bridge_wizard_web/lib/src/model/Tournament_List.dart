import 'package:flutter/material.dart';
import 'package:bridge_wizard_web/src/widget/menu_item_tile.dart';
import 'package:bridge_wizard_web/src/pages/main_page.dart';

class TournamentList extends StatelessWidget {
  const TournamentList({
    Key key,
    @required this.tournamentList,
  }) : super(key: key);

  final TournamentList tournamentList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, counter) {
                    return Divider(
                      height: 2,
                    );
                  },
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return MenuItemTile(
                      title: menuItems[index].title,
                      icon: menuItems[index].icon,
                      animationController: _animationController,
                      isSelected: selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(
                                              builder: (context)=> MainPage()));
                      },
                    );
                  },
                ),
                
    );
  }
}
