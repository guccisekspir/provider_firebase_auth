import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home_screen_example/user_repository.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController;
  TextEditingController _sifreController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController= TextEditingController(text: "");
    _sifreController= TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final _userRepo = Provider.of<UserRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Sign"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      border: OutlineInputBorder(),
                      hintText: "Mailinizi giriniz",
                      labelText: "Mail"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _sifreController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key),
                      border: OutlineInputBorder(),
                      hintText: "Şifrenizi Giriniz",
                      labelText: "Şifre"),
                ),
                 _userRepo.durum == UserDurumu.OturumAciliyor? Center(child: CircularProgressIndicator()): Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("Giriş Yap"),
                        color: Colors.tealAccent,
                        onPressed: ()async{
                          if(!await _userRepo.signIn(_emailController.text, _sifreController.text)){
                            debugPrint("Hatalı");
                          }
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),

                      RaisedButton(
                        child: Text("Kaydol"),
                        color: Colors.deepPurpleAccent,
                      )
                    ],
                  ),

                ),
                SizedBox(
                  height: 10,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
