import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/app/sign_in/sign_in_button.dart';
import 'package:time_tracker/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker/common_widgets/custom_elevated_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, this.onSignIn}) : super(key: key);
  final void Function(User) onSignIn;
  Future<void> _signInAnonymously() async {
  try {
    final userCredentials = await FirebaseAuth.instance.signInAnonymously();
    print('${userCredentials.user.uid}');
  } catch(e) {
    print(e.toString());
  }
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
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
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
            onPressed: (){},
            color: Colors.white70,
            textColor: Colors.black87,
            assetName: 'images/google-logo.png',
          ),
          SizedBox(height: 8.0,),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            onPressed: (){},
            color: Color(0xFF334D92),
            textColor: Colors.white,
          ),
      SizedBox(height: 8.0,),
      SignInButton(
        text: 'Sign in with Email',
        onPressed: (){},
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
