import 'package:TeaBrew/models/usermodel.dart';
import 'package:TeaBrew/screens/authenticate/authenticate.dart';
import 'package:TeaBrew/screens/authenticate/sign_in.dart';
import 'package:TeaBrew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    // return either Home or Authenticate
    return user == null ? Authenticate() : Home();
  }
}
