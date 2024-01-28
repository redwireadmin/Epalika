import 'package:e_palika/config/themes/colors.dart';
import 'package:flutter/material.dart';

class EndDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: CustomColors.primaryColor,
            ),
            child: Text('End Drawer Header'),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Handle item tap
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Handle item tap
            },
          ),
        ],
      ),
    );
  }
}
