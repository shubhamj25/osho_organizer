import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:oshoorganiser/toggleButton.dart';

import 'aeoui.dart';

class CreateEventUserForm extends StatefulWidget {
  @override
  _CreateEventUserFormState createState() => _CreateEventUserFormState();
}

class _CreateEventUserFormState extends State<CreateEventUserForm> {
  String _selectedDate = 'From';
  String _selectedDateTwo = 'To';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2222),
    );
    if (d != null)
      setState(() {
        _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
      });
  }

  Future<void> _selectDateTwo(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2222),
    );
    if (d != null)
      setState(() {
        _selectedDateTwo = new DateFormat.yMMMMd("en_US").format(d);
      });
  }

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
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => AeoUI()));
        if (index == 2)
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => AeoUI()));
      });
    }

    var _controller;

    final List<Widget> _children = [AeoUI(), AeoUI(), AeoUI()];
    bool isSwitched = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Create Event'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {},
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
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 3.0)),
                        labelText: "Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 3.0)),
                        hintText: "Description"),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 3.0)),
                        labelText: "Event Venue"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 3.0)),
                        hintText: "Description"),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 3.0)),
                              hintText: "Description About The Aashram",
                              labelText: "Book Event in Aashram"),
                        ),
                      ),
                    ),
                    SwitchWidget(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Text(_selectedDate,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF000000))),
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      tooltip: 'Tap to open date picker',
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
//                        TextField(

//                        ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Text(_selectedDateTwo,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF000000))),
                      onTap: () {
                        _selectDateTwo(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      tooltip: 'Tap to open date picker',
                      onPressed: () {
                        _selectDateTwo(context);
                      },
                    ),
//                        TextField(

//                        ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      title: Text("Locate on Maps"),
                      trailing: IconButton(
                        color: Colors.red,
                        icon: Icon(Icons.map),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: Color.fromRGBO(253, 11, 23, 1),
                  textColor: Colors.white,
                  child: Text(
                    "Create Event",
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Event Created",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Color.fromRGBO(253, 11, 23, 1),
                        textColor: Colors.white);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
//      floatingActionButton: new FloatingActionButton(
//          elevation: 0.0,
//          child: new Icon(Icons.save_alt),
//          backgroundColor: new Color(0xFFE57373),
//          onPressed: showToastForSubmission),
    );
  }
}

//void showToastForSubmission() {
//  Fluttertoast.showToast(
//      msg: "SUCCESSFULLY UPLOADED",
//      toastLength: Toast.LENGTH_SHORT,
//      gravity: ToastGravity.CENTER,
//      timeInSecForIosWeb: 2,
//      backgroundColor: Colors.red,
//      textColor: Colors.white);
//}
