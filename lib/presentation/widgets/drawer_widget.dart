import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: const <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(),
              accountEmail: TextRegular(
                  text: '09090104355', color: Colors.black, fontSize: 10),
              accountName: TextBold(
                  text: 'Lance Olana', color: Colors.black, fontSize: 15),
              currentAccountPicture: CircleAvatar(
                minRadius: 50,
                maxRadius: 50,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: TextBold(text: 'Home', color: Colors.black, fontSize: 12),
            ),
            ListTile(
              leading: Icon(Icons.engineering_rounded),
              title:
                  TextBold(text: 'Request', color: Colors.black, fontSize: 12),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: TextBold(text: 'About', color: Colors.black, fontSize: 12),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title:
                  TextBold(text: 'Logout', color: Colors.black, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
