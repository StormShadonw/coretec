import 'package:coretec/Widgets/LogOutAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerItem extends StatelessWidget {
  final String image;
  final String title;
  final String route;

  const DrawerItem(
      {required this.image, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        "Assets/Images/" + image,
        width: 30.0,
        height: 30.0,
      ),
      title: Text(title),
      onTap: route == "LogOut"
          ? () {
              LogOutAlertDialog.showWidgetDialog(context);
            }
          : () {
              Navigator.of(context).pushNamed(route);
            },
    );
  }
}
