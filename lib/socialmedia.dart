import 'package:flutter/material.dart';
import 'package:socialmedia_clone/models/userdata.dart';
import 'package:socialmedia_clone/views/friendlist.dart';
import 'package:socialmedia_clone/views/infoheader.dart';
import 'package:socialmedia_clone/views/mianheader.dart';
import 'package:socialmedia_clone/views/postlist.dart';

class Socialmedia extends StatefulWidget {
  const Socialmedia({super.key});

  @override
  State<Socialmedia> createState() => _SocialmediaState();
}

class _SocialmediaState extends State<Socialmedia> {
    Userdata userdata = Userdata();

    var followTxtStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Mainheader(userdata: userdata),
            Infoheader(userdata: userdata),
            Friendlist(userdata: userdata),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(children: [Text('Posts', style: followTxtStyle)]),
            ),
            const SizedBox(height: 20),
            Postlist(userdata: userdata),
          ],
        ),
      ),
    );
  }
}