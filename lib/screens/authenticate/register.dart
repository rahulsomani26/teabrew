import 'package:TeaBrew/models/usermodel.dart';
import 'package:TeaBrew/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleview;
  Register({this.toggleview});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();
  String _email = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text('Tea brew'),
        elevation: 0.0,
        backgroundColor: Colors.brown[300],
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget.toggleview();
              },
              icon: Icon(Icons.person),
              label: Text('Sign In'))
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
                  _email = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (value) {
                  return value.length < 5
                      ? 'password should be atleast 5 characters'
                      : null;
                },
                obscureText: true,
                onChanged: (value) {
                  _password = value;
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
                    child: Text('Sign Up'),
                    onPressed: () async {
                      // 1. validate form
                      if (_formKey.currentState.validate()) {
                        // print(' Valiation check passed');
                        dynamic result =
                            await _authService.registerWithEmailAndPassword(
                                _email.trim(), _password.trim());
                        if (result == null) {
                          setState(() {
                            error = 'Please give valid email / password';
                          });
                        }
                      }
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
