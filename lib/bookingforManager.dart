import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groovin_widgets/groovin_expansion_tile.dart';
import 'package:oshoorganiser/widgets/custom_icons_icons.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'aeoui.dart';
import 'insideHotelPage.dart';


List<BookingCard> allBookings=[];

class BookingPage extends StatefulWidget {
  final String email;
  final bool rememberMe;
  BookingPage({this.email,this.rememberMe});
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _bookingController=TextEditingController();
  final _fieldKey=GlobalKey<FormState>();
  String email="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: new ListView(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:20.0,horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Booking",
                            style: GoogleFonts.aBeeZee(
                                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 30.0),
                          ),
                          Text(
                            "Verification",
                            style: GoogleFonts.aBeeZee(
                                color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 25.0),
                          ),
                        ],
                      ),

                      FloatingActionButton(
                        heroTag: 244,
                        backgroundColor: Colors.redAccent,
                        child:Icon(Icons.home,color: Colors.white,),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context){
                                return AeoUI(currentState: 0,username: widget.email,rememberMe: widget.rememberMe,);
                              }
                          ));
                        },
                      )
                    ],),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 8.0),
                  child: Material(
                    elevation: 12.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    child: TextFormField(
                      key: _fieldKey,
                      validator: (val){
                        if(val==""||val==null){
                          return "Please enter an email";
                        }
                        else{
                          return null;
                        }
                      },
                      onChanged: (val){
                        setState(() {
                          email=_bookingController.text;
                        });
                        _fieldKey.currentState.validate();
                      },
                      decoration: new InputDecoration(
                        hintText: "Search booking by email",
                        border: InputBorder.none,
                        errorStyle: GoogleFonts.balooBhaina(),
                        hintStyle: GoogleFonts.balooBhaina(fontSize: 16),
                        suffixIcon: IconButton(icon: Icon(CustomIcons.search,color: Colors.blueAccent,),
                          onPressed: (){

                          },
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 8.0),
                      ),
                      controller: _bookingController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:8.0),
                              child: Icon(Icons.hourglass_full,color:Colors.blue),
                            ),
                            Text("Waiting for Approval",style: GoogleFonts.aBeeZee(fontSize: 18),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:8.0),
                              child: Icon(Icons.check_circle,color:Colors.green),
                            ),
                            Text("Accepted",style: GoogleFonts.aBeeZee(fontSize: 18),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:8.0),
                              child: Icon(Icons.cancel,color:deepRed),
                            ),
                            Text("Rejected",style: GoogleFonts.aBeeZee(fontSize: 18),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance.collection("bookings").snapshots(),
                    builder: (context, snapshot) {
                      allBookings.clear();
                      if(snapshot.hasData){
                        for(int j=0;j<snapshot.data.documents.length;j++){
                          if(snapshot.data.documents.elementAt(j).data['ashramEmail']==widget.email&&snapshot.data.documents.elementAt(j).data['email'].toString().contains(email)){
                             allBookings.add(BookingCard(snapshot.data.documents.elementAt(j).data['bookingId'],
                                snapshot.data.documents.elementAt(j).data['email']
                                , snapshot.data.documents.elementAt(j).data['eventName'],
                                snapshot.data.documents.elementAt(j).data['totalPrice']
                                , List.from(snapshot.data.documents.elementAt(j).data['personDetails']),
                                snapshot.data.documents.elementAt(j).data['bookedAt'],
                               snapshot.data.documents.elementAt(j).data['status']??null,
                             ));
                          }
                        }
                      }
                      return snapshot.hasData?
                      allBookings.isNotEmpty?Column(
                        children: allBookings,
                      ):Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text("No bookings on this email",style: GoogleFonts.balooBhai(fontSize: 18.0,color: Colors.black26),),
                      )
                          :Container(
                        height: 27,
                        width: 27,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          backgroundColor: Colors.white,
                        ),
                      );
                    }
                )
                ]
               ),
          ]
      )
      ),
    );
  }
}


class BookingCard extends StatefulWidget {
  final String bookingId,eventName,userEmail;
  final int total;
  String status;
  final Timestamp placedOn;
  final List<Map<String, dynamic>> persons;
  BookingCard(this.bookingId,this.userEmail,this.eventName,this.total,this.persons,this.placedOn,this.status);
  @override
  _BookingCardState createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  List<PeopleCard>peeps=[];
  bool processing=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<widget.persons.length;i++){
      peeps.add(PeopleCard(widget.persons.elementAt(i)['name'],widget.persons.elementAt(i)['email'],widget.persons.elementAt(i)['age'], widget.persons.elementAt(i)['gender']));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: GroovinExpansionTile(
        defaultTrailingIconColor: Colors.white,
        initiallyExpanded: false,
        boxDecoration: BoxDecoration(
            color: widget.status=="Accepted"?Colors.green: widget.status=="Rejected"?deepRed:Colors.blueAccent,
            borderRadius: BorderRadius.only(topRight: Radius.circular(16.0),bottomLeft: Radius.circular(16.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2.0,
                  spreadRadius: 2.0,
                  offset: Offset(2.0, 2.0)
              )
            ]
        ),
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("${widget.eventName}", style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: MediaQuery
                  .of(context)
                  .size
                  .width * 0.05),),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
            child: Card(
              elevation: 12.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15.0, left: 15.0, top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text("Booking Id", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width * 0.045))),

                        Expanded(child: Text("${widget.bookingId}",
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.045))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 1.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text("EventName", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width * 0.045))),
                        Expanded(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${widget.eventName}", style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.045)),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15.0, left: 15.0, bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text("Placed On:", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width * 0.045))),
                        Expanded(child: Text("${widget.placedOn
                            .toDate()
                            .day}/${widget.placedOn
                            .toDate()
                            .month}/${widget.placedOn
                            .toDate()
                            .year} at ${widget.placedOn
                            .toDate()
                            .hour}:${widget.placedOn
                            .toDate()
                            .minute} hrs", style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width * 0.045))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Column(
              children:peeps,
            ),
          ),

          widget.status==null?Row(
            children: <Widget>[
              InkWell(
                onTap: (){
                  showDialog(context: context,
                      builder: (context){
                        return StatefulBuilder(
                            builder: (context,setState){
                              return Padding(
                                  padding: const EdgeInsets.symmetric(vertical:60.0,horizontal: 0.0),
                                  child: AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                      ),
                                      contentPadding: const EdgeInsets.all(0),
                                      content:Card(
                                          shape:RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                          ),
                                          child: Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: <Widget>[
                                                Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: SingleChildScrollView(
                                                      child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: <Widget>[
                                                            Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: <Widget>[
                                                                      Text("Accept Booking",style: GoogleFonts.raleway(fontSize: 20.0,fontWeight: FontWeight.w600),),
                                                                      IconButton(
                                                                        icon: Icon(Icons.close,color: deepRed,),
                                                                        onPressed: (){
                                                                          setState(() {
                                                                            processing=false;
                                                                          });
                                                                          Navigator.pop(context);
                                                                        },
                                                                      ),
                                                                    ]
                                                                )
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(16.0),
                                                              child: Text("Do you confirm to Accept booking made by ${widget.userEmail} with a payment of ₹ ${widget.total} to your Ashram on ${widget.placedOn.toDate().day}/${widget.placedOn.toDate().month}/${widget.placedOn.toDate().year} @ ${widget.placedOn.toDate().hour}:${widget.placedOn.toDate().minute} having ${peeps.length} person?\n",
                                                                style: GoogleFonts.raleway(fontSize: 18.0),
                                                              ),
                                                            ),


                                                            Padding(
                                                              padding: const EdgeInsets.all(16.0),
                                                              child: FadingText('Long Press to Confirm',style: GoogleFonts.raleway(fontSize: 18.0),),
                                                            ),

                                                            InkWell(
                                                              onLongPress: (){
                                                                setState(() {
                                                                  processing=true;
                                                                });
                                                                Firestore.instance.collection("bookings").document(widget.bookingId).updateData({
                                                                  "status":"Accepted",
                                                                }).then((value){
                                                                  Flushbar(
                                                                    flushbarPosition: FlushbarPosition.TOP,
                                                                    shouldIconPulse: true,
                                                                    isDismissible: true,
                                                                    titleText: Text("Booking Accepted Successfully",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17.0),),
                                                                    messageText: Text("Customer booking with booking id ${widget.bookingId} has been accepted.",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15.0)),
                                                                    duration: Duration(seconds: 3),
                                                                    icon: Icon(Icons.check_circle,color: Colors.white,),
                                                                    backgroundColor:  Colors.green,
                                                                  )..show(context);
                                                                });

                                                              },
                                                              child: Container(
                                                                width: MediaQuery.of(context).size.width,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                  color: Colors.blueAccent,
                                                                  borderRadius: BorderRadius.only(bottomRight:Radius.circular(12.0) ,bottomLeft: Radius.circular(12.0)),
                                                                ),
                                                                alignment: Alignment.bottomCenter,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: <Widget>[
                                                                      Text("Accept Booking",style: GoogleFonts.balooBhaina(color: Colors.white,fontSize: 18),textAlign: TextAlign.center,),
                                                                      processing?Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal:16.0),
                                                                        child: Container(
                                                                            width: 22.0,
                                                                            height: 22.0,
                                                                            child: CircularProgressIndicator(backgroundColor: Colors.white,strokeWidth: 2.0,)),
                                                                      ):Container()
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ]
                                                      ),
                                                    )
                                                )
                                              ]
                                          )
                                      )));});});
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*0.4555,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Icon(Icons.check_circle,color: Colors.white,),
                        ),
                        Text("Accept",style: GoogleFonts.balooBhai(fontSize: 16,color: Colors.white),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0)),
                  ),
                ),
              ),
              InkWell(
                onTap:(){
                    showDialog(context: context,
                        builder: (context){
                          return StatefulBuilder(
                              builder: (context,setState){
                                return Padding(
                                    padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 0.0),
                                    child: AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                        ),
                                        contentPadding: const EdgeInsets.all(0),
                                        content:Card(
                                            shape:RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                            ),
                                            child: Stack(
                                                alignment: Alignment.bottomCenter,
                                                children: <Widget>[
                                                  Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: SingleChildScrollView(
                                                        child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: <Widget>[
                                                              Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: <Widget>[
                                                                        Text("Reject Booking",style: GoogleFonts.raleway(fontSize: 20.0,fontWeight: FontWeight.w600),),
                                                                        IconButton(
                                                                          icon: Icon(Icons.close,color:deepRed),
                                                                          onPressed: (){
                                                                            setState(() {
                                                                              processing=false;
                                                                            });
                                                                            Navigator.pop(context);
                                                                          },
                                                                        ),
                                                                      ]
                                                                  )
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.all(16.0),
                                                                child: Text("Do you confirm to reject booking made by ${widget.userEmail} with a payment of ₹ ${widget.total} to your Ashram on ${widget.placedOn.toDate().day}/${widget.placedOn.toDate().month}/${widget.placedOn.toDate().year} @ ${widget.placedOn.toDate().hour}:${widget.placedOn.toDate().minute} having ${peeps.length} person ?\n"
                                                                    "This will send ₹ ${widget.total} from your Osho Wallet back to Customer Osho Wallet.\nMake Sure you have enough money in your Osho wallet to refund the Customer.",
                                                                  style: GoogleFonts.raleway(fontSize: 18.0),
                                                                ),
                                                              ),


                                                              Padding(
                                                                padding: const EdgeInsets.all(16.0),
                                                                child: FadingText('Long Press to Confirm',style: GoogleFonts.raleway(fontSize: 18.0),),
                                                              ),

                                                              InkWell(
                                                                onLongPress: (){
                                                                  setState(() {
                                                                    processing=true;
                                                                  });
                                                                  Firestore.instance.collection("users").document(loggedInEmail).get().then((doc){
                                                                    if(doc.exists){
                                                                      if(doc.data['walletBalance']>=widget.total){
                                                                        Firestore.instance.collection("users").document(loggedInEmail).updateData({
                                                                          "walletBalance":doc.data['walletBalance']-widget.total,
                                                                        }).then((value){
                                                                          Firestore.instance.collection("users").document(widget.userEmail).get().then((document){
                                                                            if(document.exists){
                                                                              Firestore.instance.collection("users").document(widget.userEmail).updateData({
                                                                                "walletBalance":document.data['walletBalance']+widget.total,
                                                                              }).then((v){

                                                                                Firestore.instance.collection("walletTransactions").document(loggedInEmail).collection("transactions").add({
                                                                                  "amount": widget.total,
                                                                                  "fromName":doc.data['name'],
                                                                                  "toName":document.data['name'],
                                                                                  "fromEmail":doc.data['email'],
                                                                                  "toEmail":document.data['email'],
                                                                                  "time":DateTime.now().toIso8601String(),
                                                                                }).then((value) {
                                                                                  Firestore.instance.collection("walletTransactions").document(loggedInEmail).collection("transactions").document(value.documentID).updateData(
                                                                                      {
                                                                                        "transactionId": value.documentID,
                                                                                      });
                                                                                  Firestore.instance.collection("walletTransactions").document(widget.userEmail).collection("transactions").document(value.documentID).setData({
                                                                                    "amount": widget.total,
                                                                                    "fromName":doc.data['name'],
                                                                                    "toName":document.data['name'],
                                                                                    "fromEmail":doc.data['email'],
                                                                                    "toEmail":document.data['email'],
                                                                                    "time":DateTime.now().toIso8601String(),
                                                                                    "transactionId": value.documentID,
                                                                                  }).then((value){
                                                                                    Firestore.instance.collection("bookings").document(widget.bookingId).updateData({
                                                                                      "status":"Rejected",
                                                                                    }).then((value){
                                                                                      Flushbar(
                                                                                        flushbarPosition: FlushbarPosition.TOP,
                                                                                        shouldIconPulse: true,
                                                                                        isDismissible: true,
                                                                                        titleText: Text("Booking Rejected Successfully",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17.0),),
                                                                                        messageText: Text("Payment of ${widget.total} has been done from your Osho Wallet back to Customer account having email ${widget.userEmail}",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15.0)),
                                                                                        duration: Duration(seconds: 5),
                                                                                        icon: Icon(Icons.check_circle,color: Colors.white,),
                                                                                        backgroundColor:  Colors.green,
                                                                                      )..show(context).then((value){
                                                                                        setState(() {
                                                                                          processing=false;
                                                                                        });
                                                                                        Navigator.pop(context);
                                                                                      });
                                                                                    });
                                                                                  });
                                                                                }
                                                                                );

                                                                              });
                                                                            }
                                                                          });
                                                                        });
                                                                      }
                                                                      else{
                                                                        Flushbar(
                                                                          flushbarPosition: FlushbarPosition.TOP,
                                                                          shouldIconPulse: true,
                                                                          isDismissible: true,
                                                                          titleText: Text("Payment Failed",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17.0),),
                                                                          messageText: Text("Insufficient Balance in Osho Wallet.Please Add money to your Osho Wallet for InApp Transactions.",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15.0)),
                                                                          duration: Duration(seconds: 3),
                                                                          icon: Icon(Icons.close,color: Colors.white,),
                                                                          backgroundColor:  deepRed,
                                                                        )..show(context).then((value){
                                                                          setState(() {
                                                                            processing=false;
                                                                          });
                                                                          Navigator.pop(context);
                                                                        });
                                                                      }
                                                                    }
                                                                  });

                                                                },
                                                                child: Container(
                                                                  width: MediaQuery.of(context).size.width,
                                                                  height: 50,
                                                                  decoration: BoxDecoration(
                                                                    color: deepRed,
                                                                    borderRadius: BorderRadius.only(bottomRight:Radius.circular(12.0) ,bottomLeft: Radius.circular(12.0)),
                                                                  ),
                                                                  alignment: Alignment.bottomCenter,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: <Widget>[
                                                                        Text("Confirm Payment",style: GoogleFonts.balooBhaina(color: Colors.white,fontSize: 18),textAlign: TextAlign.center,),
                                                                        processing?Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal:16.0),
                                                                          child: Container(
                                                                              width: 22.0,
                                                                              height: 22.0,
                                                                              child: CircularProgressIndicator(backgroundColor: Colors.white,strokeWidth: 2.0,)),
                                                                        ):Container()
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ]
                                                        ),
                                                      )
                                                  )
                                                ]
                                            )
                                        )));});});
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*0.4555,
                  height: 50,
                  color: Colors.redAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Icon(Icons.clear,color: Colors.white,),
                        ),
                        Text("Reject",style: GoogleFonts.balooBhai(fontSize: 16,color: Colors.white),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ):
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width*0.911,
              height: 40,
              decoration: BoxDecoration(
                color: widget.status=="Accepted"?Colors.green:widget.status=="Rejected"?deepRed:Colors.blueAccent,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    widget.status=="Accepted"?Padding(
                      padding: const EdgeInsets.symmetric(horizontal:5.0),
                      child: Icon(Icons.check_circle,color: Colors.white,),
                    ):widget.status=="Rejected"?Padding(
                      padding: const EdgeInsets.symmetric(horizontal:5.0),
                      child: Icon(Icons.cancel,color: Colors.white,),
                    ):Padding(
                      padding: const EdgeInsets.symmetric(horizontal:5.0),
                      child: Icon(Icons.hourglass_full,color: Colors.white,),
                    ),
                    Text(widget.status=="Accepted"?"Accepted":widget.status=="Rejected"?"Rejected":"Waiting for Approval"
                      ,style:GoogleFonts.balooBhaina(fontSize: 18,color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )

        ],
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("id :${widget.bookingId}",
                style: TextStyle(fontSize: MediaQuery
                    .of(context)
                    .size
                    .width * 0.048, color: Colors.white,fontWeight: FontWeight.w500),),
              Text("Grand Total: Rs ${widget.total}",
                style: TextStyle(fontSize: MediaQuery
                    .of(context)
                    .size
                    .width * 0.048, color: Colors.white,fontWeight: FontWeight.w500),),
              Text("Booking Email: ${widget.userEmail}",
                style: TextStyle(fontSize: MediaQuery
                    .of(context)
                    .size
                    .width * 0.048, color: Colors.white,fontWeight: FontWeight.w600),),
              Text("Persons: ${widget.persons.length}",
                style: TextStyle(fontSize: MediaQuery
                    .of(context)
                    .size
                    .width * 0.048,color:Colors.white,fontWeight: FontWeight.w800),),


            ],
          ),
        ),
      ),
    );
  }
}

class PeopleCard extends StatefulWidget {
  final String name,email,gender,age;
  PeopleCard(this.name,this.email,this.age,this.gender);
  @override
  _PeopleCardState createState() => _PeopleCardState();
}

class _PeopleCardState extends State<PeopleCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal:8.0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))
          ),
          elevation: 10.0,
          child:
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.contacts,size: 20.0,color: Colors.blueAccent,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.0),),
                    ),
                  ],
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 85,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1.0),
                          child: Text("Name:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0)),
                        ),
                      ),
                      Expanded(
                        child: Text(widget.name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0)),
                      )
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      Container(
                        width: 85,
                        child: Text("Email:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0)),
                      ),
                      Expanded(
                        child: Text(widget.email,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0)),
                      )
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      Container(
                        width: 85,
                        child: Text("Gender:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0)),
                      ),
                      Expanded(
                        child: Text(widget.gender,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0)),
                      )
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      Container(
                        width: 85.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1.0),
                          child: Text("Age:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0)),
                        ),
                      ),
                      Expanded(
                        child: Text(widget.age,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
