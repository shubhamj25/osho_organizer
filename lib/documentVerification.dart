import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DocumentVerificationScreen extends StatefulWidget {
  @override
  _DocumentVeriState createState() => _DocumentVeriState();
}

class _DocumentVeriState extends State<DocumentVerificationScreen> {
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification"),
        backgroundColor: Colors.red,
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Proof of your Adhar Card Number"),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: _controller,
                ),
              ),
              Icon(Icons.camera_alt),
              SizedBox(
                height: 20.0,
              ),
              Text("Proof of your PAN Card Number"),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: _controller1,
                ),
              ),
              Icon(Icons.camera_alt),
              Text("Proof of your Voter Card"),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Voter Card",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(FontAwesomeIcons.addressCard),
                      )),
                  controller: _controller2,
                ),
              ),
              Icon(Icons.camera_alt),
              SizedBox(
                height: 40.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
                child: FlatButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Submission Successful",
                        textColor: Colors.white,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red);
                  },
                  color: Colors.red,
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
