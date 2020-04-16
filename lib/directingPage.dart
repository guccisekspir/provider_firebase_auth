import 'package:flutter/material.dart';
import 'package:home_screen_example/homeScreen.dart';
import 'package:provider/provider.dart';
import 'package:home_screen_example/loginPage.dart';
import 'package:home_screen_example/user_repository.dart';

class DirectingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    return Consumer(builder: (context,UserRepository userRepo,child){
      switch(userRepo.durum){


        case UserDurumu.Idle:
          return splashEkran();
          break;
        case UserDurumu.OturumAcilmamis:
        case UserDurumu.OturumAciliyor:
        return LoginPage();
        case UserDurumu.OturumAcik:
          return HomePage();
      }
    });
  }
}


class splashEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Splash"),),
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}
