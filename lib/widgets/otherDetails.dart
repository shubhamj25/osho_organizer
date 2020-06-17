import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oshoorganiser/userProfilePafe.dart';

import '../aeoui.dart';
import 'addEvents.dart';

class OtherDetails extends StatefulWidget {
  final String email;
  final bool rememberMe;
  OtherDetails({this.email,this.rememberMe});
  @override
  _OtherDetailsState createState() => _OtherDetailsState();
}

class _OtherDetailsState extends State<OtherDetails> {
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
        title: Text("Add Activities"),
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
                      labelText: "Facilities"),
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
          SizedBox(
            height: 30.0,
          ),
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
                      labelText: "Accomodation"),
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
          SizedBox(
            height: 30.0,
          ),
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
                      labelText: "Extra Facility"),
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
          SizedBox(
            height: 30.0,
          ),
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
                      labelText: "Total Price Per Head"),
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
          SizedBox(
            height: 30.0,
          ),
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
                      labelText: "Discount"),
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
          SizedBox(
            height: 30.0,
          ),
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
                      labelText: "Availability"),
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
          SizedBox(
            height: 30.0,
          ),
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
                      labelText: "Terms & Conditions"),
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

      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.send),
          backgroundColor: new Color(0xFFE57373),
          onPressed: showToastForSubmission),
    );
  }
}

void showToastForSubmission() {
  Fluttertoast.showToast(
      msg: "SUCCESSFULLY UPLOADED",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white);
}
