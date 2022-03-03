import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/app/landing_page.dart';
import 'package:time_tracker/app/sign_in/sign_in_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, this.onSignOut}) : super(key: key);

  final VoidCallback onSignOut;

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          TextButton(
              onPressed: _signOut,
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ))
        ],
      ),
    );
  }
}
