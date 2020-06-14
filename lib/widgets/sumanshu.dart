//import 'package:flutter/material.dart';
//
//class HomePage extends StatefulWidget {
//  HomePage({Key key}) : super(key: key);
//
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//
//  List cards = List();
//  TextEditingController _controller = TextEditingController();
//
//  @override
//  void initState() {
//    cards.add(buildCard(_controller));
//    super.initState();
//  }
//  @override
//  Widget build(BuildContext context) {
//
//
//    return Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.red,
//          title: Text("Add Activities"),
//          centerTitle: true,
//          actions: [
//            IconButton(
//                icon: Icon(Icons.add,color:Colors.white),
//                onPressed: (){
//                  setState(() {
//                    cards.add(buildCard(_controller));
//                  });
//                }
//            ),
//          ],
//
//        ),
//        body: ListView.builder(
//            scrollDirection: Axis.vertical,
//            shrinkWrap: true,
//            itemCount: cards.length,
//            itemBuilder: (context,index){
//              return buildCard(_controller);
//            }
//        )
//    );
//  }
//
//  Widget buildCard(TextEditingController _controller){
//    return Card(
//      elevation: 10.0,
//      child: Column(
//          children: [
//            TextField(
//              controller: _controller,
//              decoration: InputDecoration(
//                  enabledBorder: OutlineInputBorder(
//                    borderSide: BorderSide(color: Colors.black),
//                  ),
//                  focusedBorder: OutlineInputBorder(
//                      borderSide:
//                      BorderSide(color: Colors.red, width: 3.0)),
//                  hintText: "Activity Name"),
//            ),
//            IconButton(
//              icon: Icon(Icons.delete),
//              onPressed: () {
//                setState(() {});
//              },
//            ),
//            TextField(
//              controller: _controller,
//              decoration: InputDecoration(
//                  enabledBorder: OutlineInputBorder(
//                    borderSide: BorderSide(color: Colors.black),
//                  ),
//                  focusedBorder: OutlineInputBorder(
//                      borderSide:
//                      BorderSide(color: Colors.red, width: 3.0)),
//                  hintText: "Description"),
//            ),
//          ]
//      ),
//    );
//  }
