import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oshoorganiser/userProfilePafe.dart';
import 'package:oshoorganiser/widgets/addMediaForFAB.dart';

import '../aeoui.dart';
import 'addEvents.dart';

class AddOffers extends StatefulWidget {
  final String email;
  bool rememberMe;
  AddOffers({this.email,this.rememberMe});
  @override
  _AddOffersState createState() => _AddOffersState();
}

class _AddOffersState extends State<AddOffers> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    void onTappedBar(int index) {
      setState(() {
        _currentIndex = index;
        if (index == 0)
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => AeoUI()));
        if (index == 1)
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => AddEvents()));
        if (index == 2)
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => UserProfileUI(widget.email,widget.rememberMe)));
      });
    }

    var _controller;

    final List<Widget> _children = [AeoUI(), AddEvents(), AeoUI()];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Add Offers"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              ListView(
                children: [
                  Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  hintText: "Activity Name"),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {});
                              },
                            )
                          ],
                        ),
                        TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              hintText: "Description"),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.add,
                size: 25.0,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Card(
            elevation: 10.0,
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red, width: 3.0)),
                      hintText: "Activity Name"),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {});
                  },
                ),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red, width: 3.0)),
                      hintText: "Description"),
                )
              ],
            ),
          ),
        ],
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: _currentIndex, onTap: onTappedBar,
//        items: [
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.home,
//                color: Color.fromARGB(255, 196, 26, 61),
//              ),
//              title: Text("Home")),
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.card_travel,
//                color: Color.fromARGB(255, 196, 26, 61),
//              ),
//              title: Text("Booking")),
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.person,
//                color: Color.fromARGB(255, 196, 26, 61),
//              ),
//              title: Text("Profile")),
//        ],
//
////        child: Container(
////          padding: const EdgeInsets.only(top: 10.0),
////          height: 60,
////          child: Row(
////            mainAxisAlignment: MainAxisAlignment.spaceAround,
////            children: <Widget>[
////              Column(
////                children: <Widget>[
//
////                  Text('Home',
////                      style: TextStyle(
////                        color: Color.fromARGB(255, 196, 26, 61),
////                      )),
////                ],
////              ),
////              Column(
////                children: <Widget>[
////                  Icon(Icons.favorite_border),
////                  Text('Saved'),
////                ],
////              ),
////              Column(
////                children: <Widget>[
////                  Icon(Icons.card_travel),
////                  Text('Booking'),
////                ],
////              ),
////              Column(
////                children: <Widget>[
////                  Icon(Icons.group_add),
////                  Text('Invite & Earn'),
////                ],
////              )
////            ],
////          ),
////        ),
//      ),
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.arrow_forward),
          backgroundColor: new Color(0xFFE57373),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => AddMediaFor()));
          }),
    );
  }
}
