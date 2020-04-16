import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UserRepository userRepo, child) => Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
        ),
        body: Center(
          child: RaisedButton(
            child: Text(userRepo.user.email),
            onPressed: () {
              userRepo.signOut();
            },
          ),
        ),
      ),
    );
  }
}
