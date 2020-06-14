import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventOrganiser extends StatefulWidget {
  const EventOrganiser({Key key, this.title}) : super(key: key);

  @override
  _EventOrganiserState createState() => _EventOrganiserState();
  final String title;
}

class _EventOrganiserState extends State<EventOrganiser> {
  String _selectedDate = 'Tap to select date';

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

  @override
  Widget build(BuildContext context) {
    final maxlines = 5;
    var _controller;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Add Organising Events"),
      ),
      body: ListView(
        shrinkWrap: true,
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
                      hintText: "Event Name"),
                ),
                Container(
                  margin: EdgeInsets.all(12.0),
                  child: TextField(
                    style: TextStyle(
                      height: maxlines * 2.0,
                    ),
                    controller: _controller,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.red,
                          width: 3.0,
                        )),
                        hintText: "Accomodation Description"),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Colors.black),
                        left: BorderSide(width: 1.0, color: Colors.black),
                        right: BorderSide(width: 1.0, color: Colors.black),
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
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
                          color: Colors.red,
                          icon: Icon(Icons.calendar_today),
                          tooltip: 'Tap to open date picker',
                          onPressed: () {
                            _selectDate(context);
                          },
                        ),
//                        TextField(
//                          controller: _controller,
//                          decoration: InputDecoration(
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.black),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      color: Colors.red, width: 3.0)),
//                              hintText: "Activities"),
//                        ),
//                        TextField(
//                          controller: _controller,
//                          decoration: InputDecoration(
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.black),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      color: Colors.red, width: 3.0)),
//                              hintText: "Special Offers"),
//                        ),
//                        TextField(
//                          controller: _controller,
//                          decoration: InputDecoration(
//                              suffixIcon: Icon(Icons.attach_file),
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.black),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      color: Colors.red, width: 3.0)),
//                              hintText: "Image of the instructer"),
//                        ),
//                        TextField(
//                          controller: _controller,
//                          decoration: InputDecoration(
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.black),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      color: Colors.red, width: 3.0)),
//                              hintText: "Place of event"),
//                        ),
//                        TextField(
//                          controller: _controller,
//                          decoration: InputDecoration(
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.black),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      color: Colors.red, width: 3.0)),
//                              hintText: "Facilities(Breakfast,lunch,dinner)"),
//                        ),
//                        TextField(
//                          controller: _controller,
//                          decoration: InputDecoration(
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.black),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      color: Colors.red, width: 3.0)),
//                              hintText:
//                                  "Any Extra Facilities(wifi,heater,geezer etc)"),
//                        ),
//                        TextField(
//                          controller: _controller,
//                          decoration: InputDecoration(
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.black),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      color: Colors.red, width: 3.0)),
//                              hintText: "Total price per head"),
//                        ),
//                        TextField(
//                          controller: _controller,
//                          decoration: InputDecoration(
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.black),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      color: Colors.red, width: 3.0)),
//                              hintText: "Discount"),
//                        ),
//                        TextField(
//                          controller: _controller,
//                          decoration: InputDecoration(
//                              suffixIcon: Icon(Icons.attach_file),
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.black),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      color: Colors.red, width: 3.0)),
//                              hintText: "Past event image"),
//                        ),
//                        TextField(
//                          controller: _controller,
//                          decoration: InputDecoration(
//                              suffixIcon: Icon(Icons.attach_file),
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.black),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      color: Colors.red, width: 3.0)),
//                              hintText: "Availability"),
//                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
