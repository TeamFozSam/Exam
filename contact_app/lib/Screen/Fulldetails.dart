import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class FullDetails extends StatefulWidget {
  String iD;
  String name;
  String mobile;
  String emailID;
  String gender;
  String birthday;
  String imageURL;
  FullDetails(
      {Key key,
      @required this.iD,
      this.name,
      this.mobile,
      this.emailID,
      this.gender,
      this.birthday,
      this.imageURL})
      : super(key: key);
  @override
  _FullDetailsState createState() => _FullDetailsState(
        iD: iD,
        name: name,
        mobile: mobile,
        emailID: emailID,
        gender: gender,
        birthday: birthday,
        imageURL: imageURL,
      );
}

class _FullDetailsState extends State<FullDetails> {
  String iD;
  String name;
  String mobile;
  String emailID;
  String gender;
  String birthday;
  String imageURL;
  _FullDetailsState(
      {Key key,
      @required this.iD,
      this.name,
      this.mobile,
      this.emailID,
      this.gender,
      this.birthday,
      this.imageURL});
  final String url = "http://userapi.tk/shobhit/data";
  List data;
  bool isloading = true;
  @override
  void initState() {
    super.initState();
    this.getjsondata();
  }

  Future getjsondata() async {
    var response = await http.get(Uri.encodeFull(url));
    setState(() {
      var converdatatojason = json.decode(response.body);
      data = converdatatojason;
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Full"),
      ),
      body: Center(
          child: Container(
        child: isloading
            ? CircularProgressIndicator()
            : Container(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 200,
                    child: Image.network(imageURL)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(name, style: TextStyle(fontSize: 20.0, color: Colors.black),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(emailID, style: TextStyle(fontSize: 20.0, color: Colors.black),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(birthday, style: TextStyle(fontSize: 20.0, color: Colors.black),),
                  ),
                  Row(
                    children: <Widget>[
                     GestureDetector(
                    onTap: (){
                      launch("tel:+91$mobile");
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      color: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 32.0,),
                      ),
                    ),
                  ),
                    ],
                  )
                ],
              )),
      )),
    );
  }
}
