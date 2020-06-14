import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscriptionOfAashram extends StatefulWidget {
  @override
  _SubscriptionOfAashramState createState() => _SubscriptionOfAashramState();
}

class _SubscriptionOfAashramState extends State<SubscriptionOfAashram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Subscriptions Available"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
//                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset("assets/images/sub1.PNG")),
              Text(
                "Blue Subscription",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
//              ListTile(),
//              SizedBox(
//                height: 10.0,
//              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset(
                    "assets/images/sub2.PNG",
                  )),
              Text(
                "Silver Subscription",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset(
                    "assets/images/sub3.PNG",
                  )),
              Text(
                "Gold Subscription",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
