import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Home.dart';
import './Login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  bool _autovalidate = false;
  String name, _email, mobile, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        appBar: new AppBar(title: Text("Signup")),
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
                            return "Enter name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: "Name"),
                        onSaved: (input) => name = input,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return "Enter email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: "Email"),
                        onSaved: (input) => _email = input,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return "Enter Mobile No.";
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: "Mobile"),
                        onSaved: (input) => mobile = input,
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
                        decoration: InputDecoration(labelText: "Enter pasword"),
                        onSaved: (input) => _password = input,
                      ),
                    ),
                    MaterialButton(
                      height: 40,
                      minWidth: 200,
                      onPressed: signup,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.lightBlue,
                    ),
                    MaterialButton(
                        height: 40,
                      minWidth: 200,
                      onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Login()
                      )),
                      child: Text(
                        "Login",
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
        user = (await auth.createUserWithEmailAndPassword(
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
