import 'package:flutter/material.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_form_change_notifier.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_form_stateful.dart';

import 'package:time_tracker/services/auth.dart';

import 'email_sign_in_form_bloc_based.dart';
class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        centerTitle: true,
        title: Text('Sign in'),
        backgroundColor: Colors.indigo,
        elevation: 2.0,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
            child:Card(
                child: EmailSignInFormChangeNotifier.create(context),
            )
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Container();
  }
}
