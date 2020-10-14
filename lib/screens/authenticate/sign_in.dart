import 'package:TeaBrew/models/usermodel.dart';
import 'package:TeaBrew/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleview;
  SignIn({this.toggleview});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text('Tea Preference'),
        elevation: 0.0,
        backgroundColor: Colors.brown[300],
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget.toggleview();
              },
              icon: Icon(Icons.person),
              label: Text('Register'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? 'Enter Email' : null;
                },
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (value) {
                  return value.length < 5 ? ' Enter correct password' : null;
                },
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: Colors.red,
                    child: Text('Sign In'),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            this.email.trim(), this.password.trim());
                        if (result is String) {
                          setState(() {
                            error = result;
                          });
                        }
                      }

                      print('Signed in with email and password');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
