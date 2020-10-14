import 'package:TeaBrew/models/usermodel.dart';
import 'package:TeaBrew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text(
          'Brew Crew',
          style: TextStyle(color: Colors.brown),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          FlatButton.icon(
              onPressed: () async {
                // logout code

                await _auth.signOut();
                // Navigates to Authenticate page ( why ?)
                print('signed out ');
              },
              icon: Icon(Icons.person),
              label: Text('Log out '),),
        ],
      ),
    );
  }
}
