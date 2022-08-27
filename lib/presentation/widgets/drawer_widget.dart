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
          children: <Widget>[
            const UserAccountsDrawerHeader(
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
            const ListTile(
              leading: Icon(Icons.person),
              title:
                  TextBold(text: 'My Post', color: Colors.black, fontSize: 12),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: TextBold(text: 'Home', color: Colors.black, fontSize: 12),
            ),
            const ListTile(
              leading: Icon(Icons.engineering_rounded),
              title: TextBold(
                  text: 'Request (0)', color: Colors.black, fontSize: 12),
            ),
            const ListTile(
              leading: Icon(Icons.info),
              title: TextBold(text: 'About', color: Colors.black, fontSize: 12),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const TextBold(
                              text: 'Logout Confirmation',
                              color: Colors.black,
                              fontSize: 14),
                          content: const TextRegular(
                              text: 'Are you sure you want to logout?',
                              color: Colors.black,
                              fontSize: 12),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const TextBold(
                                  text: 'Close',
                                  color: Colors.black,
                                  fontSize: 12),
                            ),
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const TextBold(
                                  text: 'Continue',
                                  color: Colors.black,
                                  fontSize: 12),
                            ),
                          ],
                        ));
              },
              leading: Icon(
                Icons.logout,
                color: Colors.red[700],
              ),
              title: TextBold(
                  text: 'Logout', color: Colors.red[700]!, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
