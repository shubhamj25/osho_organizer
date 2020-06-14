import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FollowingPerson extends StatefulWidget {
  @override
  _FollowingPersonState createState() => _FollowingPersonState();
}

class _FollowingPersonState extends State<FollowingPerson> {
  String locationText;
  String flagImage;
  List locationText1 = [
    'weidai@mac.com',
    'demmel@aol.com',
    'attwood@gmail.com',
    'mthurn@sbcglobal.net',
    'uqmcolyv@comcast.net',
    'jgwang@verizon.net',
    'reziac@yahoo.ca',
    'benanov@yahoo.com',
    'mfburgo@hotmail.com',
    'henkp@att.net',
    'natepuri@comcast.net',
    'solomon@me.com'
  ];
  List flagImage1 = [
    'bandi.jpg',
    'bandi.jpg',
    'bandi.jpg',
    'bandi.jpg',
    'bandi.jpg',
    'bandi.jpg',
    'bandi.jpg',
    'bandi.jpg',
    'bandi.jpg',
    'bandi.jpg',
    'bandi.jpg',
    'bandi.jpg',
  ];
  List subtitileList = [
    'follows you',
    'follows you',
    'follows you',
    'follows you',
    'follows you',
    'follows you',
    'follows you',
    'follows you',
    'follows you',
    'follows you',
    'follows you',
    'follows you',
  ];
  List followers = [
    'UNFOLLOW',
    'UNFOLLOW',
    'UNFOLLOW',
    'UNFOLLOW',
    'UNFOLLOW',
    'UNFOLLOW',
    'UNFOLLOW',
    'UNFOLLOW',
    'UNFOLLOW',
    'UNFOLLOW',
    'UNFOLLOW',
    'UNFOLLOW',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Following"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.notifications),
          )
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locationText1.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10.0,
              child: ListTile(
                onTap: () {},
                title: Text(locationText1[index]),
                subtitle: Text(subtitileList[index]),
                trailing: Container(
                  height: 25.0,

//                  color: Colors.red,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    color: Colors.red,
                    child: Text(
                      followers[index],
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/${flagImage1[index]}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
