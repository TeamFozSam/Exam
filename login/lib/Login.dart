import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController p = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();
  bool _autovalidate = false;
  String name, _email, mobile, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: Text("Log in")),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.person),
                      title: TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return "enter email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: "Email"),
                        onSaved: (input) => _email = input,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.security),
                      title: TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return "Enter password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: "Enter password"),
                        onSaved: (input) => _password = input,
                      ),
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(),
                        controller: p,
                      ),
                    ),
                    MaterialButton(
                      height: 40,
                      minWidth: 200,
                      onPressed: signup,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.lightBlue,
                    ),
                    MaterialButton(
                      height: 40,
                      minWidth: 200,
                      onPressed: () => Navigator.of(context).pushNamed("/signup"),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void signup() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      try {
        FirebaseAuth auth = await FirebaseAuth.instance;
        FirebaseUser user;
        user = (await auth.signInWithEmailAndPassword(
                email: _email, password: _password))
            .user;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                    user: user,
                  )),
        );
      } catch (e) {
        print(e.message);
      }
    }
  }
}
