import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).accentColor,
              child: Text(
                'Navigation',
                style: GoogleFonts.quicksand(fontWeight: FontWeight.w800, fontSize: 30, color: Colors.white),
              )),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              'Logout',
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Colors.grey[600],
              ),
            ),
            leading: Icon(Icons.exit_to_app, size: 26, color: Colors.grey[600]),
            onTap: () {
              //shows a dialog on screen that lets the user choose between cancel and return to page and signing out of the up.
              showDialog(
                  context: context,
                  builder: ((ctx) => AlertDialog(
                        title: Text('Are you sure?'),
                        content: Text('Do you want to sign out?'),
                        actions: [
                          TextButton(
                            child: Text('No'),
                            onPressed: () {
                              Navigator.of(ctx).pop(true);
                            },
                          ),
                          TextButton(
                            child: Text('Yes'),
                            onPressed: () {
                              FirebaseAuth.instance.signOut(); //Firebase function.
                              Navigator.of(ctx).pop();
                            },
                          )
                        ],
                      )));
            },
          )
        ],
      ),
    );
  }
}
