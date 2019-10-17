import 'package:contact_app/Screen/Fulldetails.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final String url = "http://userapi.tk/";
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
        title: Text("Home"),
      ),
      body: Center(
          child: Container(
        child: isloading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext contex, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data[index]["ImageURL"]),
                    ),
                    title: Text(data[index]['Name']),
                    subtitle: Text(data[index]['EmailID']),
                    onTap: () => _fullDetails(
                      data[index]['ID'],
                      data[index]['Name'],
                      data[index]['Mobile'],
                      data[index]['EmailID'],
                      data[index]['Gender'],
                      data[index]['Birthday'],
                      data[index]['ImageURL'],
                    ),
                  );
                }),
      )),
    );
  }

  _fullDetails(String iD, String name, String mobile, String emailID,
      String gender, String birthday, String imageURL) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FullDetails(
                iD: iD,
                name: name,
                mobile: mobile,
                emailID: emailID,
                gender: gender,
                birthday: birthday,
                imageURL: imageURL)));
  }
}
