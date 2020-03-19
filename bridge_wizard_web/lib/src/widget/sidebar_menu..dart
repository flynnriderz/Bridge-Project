import 'package:flutter/material.dart';
import 'package:bridge_wizard_web/src/commons/theme.dart';
import 'package:bridge_wizard_web/src/model/menu.dart';
import 'package:bridge_wizard_web/src/pages/main_page.dart';
import 'package:bridge_wizard_web/src/widget/menu_item_tile.dart';
import 'package:bridge_wizard_web/src/widget/create_tournament.dart';


class SideBarMenu extends StatefulWidget {
  @override
  _SideBarMenuState createState() => _SideBarMenuState();
}
int selectedIndex = 0;
class _SideBarMenuState extends State<SideBarMenu>
    with SingleTickerProviderStateMixin {
  double maxWidth = 260;
  double minWidgth = 70;
  bool collapsed = false;
  

  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    _animation = Tween<double>(begin: maxWidth, end: minWidgth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget child) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black26, spreadRadius: 2)
            ],
            color: drawerBgColor,
          ),
          width: _animation.value,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             
              SizedBox(
                height: 80,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, counter) {
                    return Divider(
                      height: 2,
                    );
                  },
                  itemCount: menuItems.length,
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
                
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, counter) {
                    return Divider(
                      height: 2,
                    );
                  },
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return MenuItemTile(
                      title: 'Create Tournament',
                      icon:  Icons.create_new_folder,
                      animationController: _animationController,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                                              builder: (context)=> CreateTournament()));
                      },
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    collapsed = !collapsed;
                    collapsed
                        ? _animationController.reverse()
                        : _animationController.forward();
                  });
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: _animationController,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              
            ],
            
          ),
          
        );
      },
    );
  }
}
