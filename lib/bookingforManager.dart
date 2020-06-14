import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'insideHotelPage.dart';
import 'organiserPageNotifications.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Bookings",
          style: GoogleFonts.balooBhaina(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25.0),
        ),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 15),
              child: IconButton(
                icon: Icon(Icons.notifications_active), color: Colors.red,
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          OrganiserNotifications()));
                }, //notification Page of the consumer
              ))
        ],
      ),
      body: new ListView(
        children: [
          Column(
            children: <Widget>[
              Stack(
                children: [
                  Card(
                    elevation: 10.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HotelDetailsPage()));
                      },
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/50.PNG'),
                          SizedBox(
                            height: 20.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Parmarth Niketan Ashram",
                              style: GoogleFonts.balooBhaina(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton.icon(
                                color: Colors.green,
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Accepted",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Accept",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.green,
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              FlatButton.icon(
                                color: Color.fromRGBO(253, 11, 23, 1),
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Declined",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Decline",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color.fromRGBO(253, 11, 23, 1),
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: 20.0,
          ),
          Column(
            children: <Widget>[
              Stack(
                children: [
                  Card(
                    elevation: 10.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HotelDetailsPage()));
                      },
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/50.PNG'),
                          SizedBox(
                            height: 20.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Parmarth Niketan Ashram",
                              style: GoogleFonts.balooBhaina(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton.icon(
                                color: Colors.green,
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Accepted",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Accept",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.green,
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              FlatButton.icon(
                                color: Color.fromRGBO(253, 11, 23, 1),
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Declined",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Decline",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color.fromRGBO(253, 11, 23, 1),
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: 20.0,
          ),
          Column(
            children: <Widget>[
              Stack(
                children: [
                  Card(
                    elevation: 10.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HotelDetailsPage()));
                      },
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/50.PNG'),
                          SizedBox(
                            height: 20.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Parmarth Niketan Ashram",
                              style: GoogleFonts.balooBhaina(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton.icon(
                                color: Colors.green,
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Accepted",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Accept",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.green,
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              FlatButton.icon(
                                color: Color.fromRGBO(253, 11, 23, 1),
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Declined",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Decline",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color.fromRGBO(253, 11, 23, 1),
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: 20.0,
          ),
          Column(
            children: <Widget>[
              Stack(
                children: [
                  Card(
                    elevation: 10.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HotelDetailsPage()));
                      },
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/50.PNG'),
                          SizedBox(
                            height: 20.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Parmarth Niketan Ashram",
                              style: GoogleFonts.balooBhaina(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton.icon(
                                color: Colors.green,
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Accepted",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Accept",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.green,
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              FlatButton.icon(
                                color: Color.fromRGBO(253, 11, 23, 1),
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Declined",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Decline",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color.fromRGBO(253, 11, 23, 1),
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: 20.0,
          ),
          Column(
            children: <Widget>[
              Stack(
                children: [
                  Card(
                    elevation: 10.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HotelDetailsPage()));
                      },
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/50.PNG'),
                          SizedBox(
                            height: 20.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Parmarth Niketan Ashram",
                              style: GoogleFonts.balooBhaina(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton.icon(
                                color: Colors.green,
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Accepted",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Accept",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.green,
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              FlatButton.icon(
                                color: Color.fromRGBO(253, 11, 23, 1),
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Declined",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Decline",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color.fromRGBO(253, 11, 23, 1),
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: 20.0,
          ),
          Column(
            children: <Widget>[
              Stack(
                children: [
                  Card(
                    elevation: 10.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HotelDetailsPage()));
                      },
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/50.PNG'),
                          SizedBox(
                            height: 20.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Parmarth Niketan Ashram",
                              style: GoogleFonts.balooBhaina(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton.icon(
                                color: Colors.green,
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Accepted",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Accept",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.green,
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              FlatButton.icon(
                                color: Color.fromRGBO(253, 11, 23, 1),
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Declined",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Decline",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color.fromRGBO(253, 11, 23, 1),
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: 20.0,
          ),
          Column(
            children: <Widget>[
              Stack(
                children: [
                  Card(
                    elevation: 10.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HotelDetailsPage()));
                      },
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/50.PNG'),
                          SizedBox(
                            height: 20.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Parmarth Niketan Ashram",
                              style: GoogleFonts.balooBhaina(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton.icon(
                                color: Colors.green,
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Accepted",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Accept",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.green,
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              FlatButton.icon(
                                color: Color.fromRGBO(253, 11, 23, 1),
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Declined",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Decline",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color.fromRGBO(253, 11, 23, 1),
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: 20.0,
          ),
          Column(
            children: <Widget>[
              Stack(
                children: [
                  Card(
                    elevation: 10.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HotelDetailsPage()));
                      },
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/50.PNG'),
                          SizedBox(
                            height: 20.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Parmarth Niketan Ashram",
                              style: GoogleFonts.balooBhaina(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton.icon(
                                color: Colors.green,
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Accepted",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Accept",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.green,
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              FlatButton.icon(
                                color: Color.fromRGBO(253, 11, 23, 1),
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Declined",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Decline",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color.fromRGBO(253, 11, 23, 1),
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: 20.0,
          ),
          Column(
            children: <Widget>[
              Stack(
                children: [
                  Card(
                    elevation: 10.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HotelDetailsPage()));
                      },
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/50.PNG'),
                          SizedBox(
                            height: 20.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Parmarth Niketan Ashram",
                              style: GoogleFonts.balooBhaina(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton.icon(
                                color: Colors.green,
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Accepted",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Accept",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.green,
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              FlatButton.icon(
                                color: Color.fromRGBO(253, 11, 23, 1),
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Declined",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Decline",
                                  style: GoogleFonts.balooBhaina(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color.fromRGBO(253, 11, 23, 1),
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: 20.0,
          ),

//          Column(
//            children: <Widget>[
//              Stack(
//                children: [Image.asset('images/12.jpg')],
//              ),
//            ],
//          ),
//          Column(
//            children: <Widget>[
//              Stack(
//                children: [Image.asset('images/12.jpg')],
//              ),
//            ],
//          ),
//          Column(
//            children: <Widget>[
//              Stack(
//                children: [Image.asset('images/12.jpg')],
//              ),
//            ],
//          ),
        ],
      ),
    );
  }
}
