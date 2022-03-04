

import 'package:flutter/material.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker/app/sign_in/sign_in_button.dart';
import 'package:time_tracker/app/sign_in/social_sign_in_button.dart';

import '../../services/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key,@required this.auth,}) : super(key: key);
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
  try {
    await auth.signInAnonymously();
  }
  catch(e) {
    print(e.toString());
  }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> _signInWithFacebook() async {
    try {
      await auth.signInWithFacebook();
    }
    catch(e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context)=>EmailSignInPage()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Time Tracker'),
        backgroundColor: Colors.indigo,
        elevation: 2.0,
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 48.0,
          ),
          SocialSignInButton(
            text: 'Sign in with Google',
            onPressed: _signInWithGoogle,
            color: Colors.white70,
            textColor: Colors.black87,
            assetName: 'images/google-logo.png',
          ),
          SizedBox(height: 8.0,),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            onPressed: _signInWithFacebook,
            color: Color(0xFF334D92),
            textColor: Colors.white,
          ),
      SizedBox(height: 8.0,),
      SignInButton(
        text: 'Sign in with Email',
        onPressed: ()=> _signInWithEmail(context),
        color: Colors.teal[700],
        textColor: Colors.white,
        ),
          SizedBox(height: 8.0,),
          Text('Or',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black87
          ),
          textAlign: TextAlign.center,),
      SizedBox(height: 8.0,),
      SignInButton(
        text: 'Go anonymous',
        onPressed: _signInAnonymously,
        color: Colors.lime[300],
        textColor: Colors.black,),
        ],
      ),
    );
  }
}
