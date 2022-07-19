import 'package:bugelas/constraints.dart';
import 'package:flutter/material.dart';
import 'package:bugelas/main_screen_new.dart';
import 'package:bugelas/about_screen.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Material(
        color: brightBlue,
        child: ListView(children: <Widget>[
          menuItem(
              text: 'Catalog',
              icon: Icons.home_rounded,
              onClicked: () => selectedItem(context, 0)),
          menuItem(
              text: 'About',
              icon: Icons.question_mark_rounded,
              onClicked: () => selectedItem(context, 1)),
        ]),
      ),
    );
  }

  Widget menuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = pureWhite;

    return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding * 3),
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color, fontSize: 16.0)),
        onTap: onClicked);
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MainScreenNew(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutScreen()));
        break;
    }
  }
}
