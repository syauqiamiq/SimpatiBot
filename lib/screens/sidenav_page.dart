import 'package:flutter/material.dart';
import 'package:simpati_bot/utils/colorPallete.dart';

class SideNav extends StatelessWidget {
  final String nameHeader;
  final String emailHeader;
  SideNav({this.emailHeader, this.nameHeader});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(nameHeader),
                accountEmail: Text(emailHeader),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('lib/assets/images/yuda.jpg'),
                ),
                decoration: BoxDecoration(color: Pallete.primaryColor),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Log Out"),
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
