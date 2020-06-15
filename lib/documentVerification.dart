import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'aeoui.dart';
import 'documentImg.dart';
String adharImgUrl;
String PANImgUrl;
String VoterImgUrl;
class DocumentVerificationScreen extends StatefulWidget {
 final String email;
  final bool rememberMe;

  DocumentVerificationScreen({Key key,this.email,this.rememberMe}): super(key: key);
  @override
  _DocumentVeriState createState() => _DocumentVeriState();
}

class _DocumentVeriState extends State<DocumentVerificationScreen> {
  bool submitting=false;
  final _formKey=GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firestore.instance.collection("users").document(widget.email).get().then((doc){
      if(doc.exists){
        if(doc.data['activated']){
          setState(() {
            activated=true;
          });
        }
        else{
          activated=false;
        }
      }
    });
  }
  bool activated;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
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
                            "Document",
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
                        heroTag: 324452,
                        backgroundColor: Colors.redAccent,
                        child:Icon(Icons.reply,color: Colors.white,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Following Documents are required and mandatory for your "
                          "identity verification so that you could host "
                          "events publicly",style: GoogleFonts.aBeeZee(color:Colors.black38,fontSize: 19,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Proof of your Adhar Card Number",style: GoogleFonts.aBeeZee(color:Colors.black45,fontSize: 18),),
                      adharImgUrl!=""&&adharImgUrl!=null?
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:8.0),
                        child: Material(
                          elevation: 10.0,
                          color: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.9,
                            height: MediaQuery.of(context).size.height*0.4,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: <Widget>[
                                CachedNetworkImage(
                                  imageUrl: "$adharImgUrl",
                                  fadeInDuration: Duration(milliseconds: 500),
                                  fadeInCurve: Curves.easeIn,
                                  width: MediaQuery.of(context).size.width*0.9,
                                  height: 300,
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      image: DecorationImage(
                                          image: imageProvider, fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) => Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    child: FloatingActionButton(
                                      heroTag: 91011,
                                      child: Icon(Icons.delete,color: deepRed,),
                                      backgroundColor: Colors.white,
                                      onPressed: (){
                                        setState(() {
                                          adharImgUrl=null;
                                        });
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                          :Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Material(
                            color: Colors.blueAccent,
                            elevation: 12.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            child: Container(
                                width: MediaQuery.of(context).size.width*0.9,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Upload Image",style: GoogleFonts.balooBhai(color: Colors.white,fontSize: 16.0),),
                                      IconButton(icon: Icon(Icons.camera_alt,color:Colors.white),
                                        onPressed: (){
                                            showDialog(context: context,
                                                builder: (context){
                                                  return StatefulBuilder(
                                                    builder: (context,setState){
                                                      return Padding(
                                                        padding: const EdgeInsets.symmetric(vertical:20.0),
                                                        child: AlertDialog(
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                                          ),
                                                          contentPadding: const EdgeInsets.all(0),
                                                          content: DocumentImageCapture(widget.key,widget.email,"adhar"),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }
                                            );

                                        },
                                      )
                                    ],
                                  ),
                                ))
                        ),
                      ),

                      SizedBox(
                        height: 20.0,
                      ),
                      Text("Proof of your PAN Card Number",style: GoogleFonts.aBeeZee(color:Colors.black45,fontSize: 18)),
                      PANImgUrl!=""&&PANImgUrl!=null?
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:8.0),
                        child: Material(
                          elevation: 10.0,
                          color: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.9,
                            height: MediaQuery.of(context).size.height*0.4,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: <Widget>[
                                CachedNetworkImage(
                                  imageUrl: "$PANImgUrl",
                                  fadeInDuration: Duration(milliseconds: 500),
                                  fadeInCurve: Curves.easeIn,
                                  width: MediaQuery.of(context).size.width*0.9,
                                  height: 300,
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      image: DecorationImage(
                                          image: imageProvider, fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) => Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    child: FloatingActionButton(
                                      heroTag: 678,
                                      child: Icon(Icons.delete,color: deepRed,),
                                      backgroundColor: Colors.white,
                                      onPressed: (){
                                        setState(() {
                                          PANImgUrl=null;
                                        });
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                          :Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Material(
                            color: Colors.blueAccent,
                            elevation: 12.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            child: Container(
                                width: MediaQuery.of(context).size.width*0.9,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Upload Image",style: GoogleFonts.balooBhai(color: Colors.white,fontSize: 16.0),),
                                      IconButton(icon: Icon(Icons.camera_alt,color:Colors.white),
                                        onPressed: (){
                                            showDialog(context: context,
                                                builder: (context){
                                                  return StatefulBuilder(
                                                    builder: (context,setState){
                                                      return Padding(
                                                        padding: const EdgeInsets.symmetric(vertical:20.0),
                                                        child: AlertDialog(
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                                          ),
                                                          contentPadding: const EdgeInsets.all(0),
                                                          content: DocumentImageCapture(widget.key,widget.email,"PAN"),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }
                                            );
                                        },
                                      )
                                    ],
                                  ),
                                ))
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text("Proof of your Voter Card",style: GoogleFonts.aBeeZee(color:Colors.black45,fontSize: 18)),
                      VoterImgUrl!=""&&VoterImgUrl!=null?
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:8.0),
                        child: Material(
                          elevation: 10.0,
                          color: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.9,
                            height: MediaQuery.of(context).size.height*0.4,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: <Widget>[
                                CachedNetworkImage(
                                  imageUrl: "$VoterImgUrl",
                                  fadeInDuration: Duration(milliseconds: 500),
                                  fadeInCurve: Curves.easeIn,
                                  width: MediaQuery.of(context).size.width*0.9,
                                  height: 300,
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      image: DecorationImage(
                                          image: imageProvider, fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) => Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    child: FloatingActionButton(
                                      heroTag: 345,
                                      child: Icon(Icons.delete,color: deepRed,),
                                      backgroundColor: Colors.white,
                                      onPressed: (){
                                        setState(() {
                                          VoterImgUrl=null;
                                        });
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                          :Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Material(
                            color: Colors.blueAccent,
                            elevation: 12.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            child: Container(
                                width: MediaQuery.of(context).size.width*0.9,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Upload Image",style: GoogleFonts.balooBhai(color: Colors.white,fontSize: 16.0),),
                                      IconButton(icon: Icon(Icons.camera_alt,color:Colors.white),
                                        onPressed: (){
                                            showDialog(context: context,
                                                builder: (context){
                                                  return StatefulBuilder(
                                                    builder: (context,setState){
                                                      return Padding(
                                                        padding: const EdgeInsets.symmetric(vertical:20.0),
                                                        child: AlertDialog(
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                                          ),
                                                          contentPadding: const EdgeInsets.all(0),
                                                          content: DocumentImageCapture(widget.key,widget.email,"Voter"),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }
                                            );

                                        },
                                      )
                                    ],
                                  ),
                                ))
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: deepRed,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        submitting=true;
                      });
                      if(!activated){
                        if(adharImgUrl!=null&&PANImgUrl!=null&&VoterImgUrl!=null){
                          Firestore.instance.collection("users").document(widget.email).updateData({
                            "adharImg":adharImgUrl.toString(),
                            "PANImg":PANImgUrl.toString(),
                            "VoterImg":VoterImgUrl.toString(),
                          }).then((value){
                            Flushbar(
                              shouldIconPulse: true,
                              isDismissible: true,
                              flushbarPosition: FlushbarPosition.TOP,
                              titleText: Text("Submission Successful",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17.0),),
                              messageText: Text("Your details have been passed on to the admin for verification.On Completion of Verification your account will be "
                                  "activated.",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15.0)),
                              duration: Duration(seconds: 5),
                              icon: Icon(Icons.check_circle,color: Colors.white,),
                              backgroundColor: Colors.green,
                            )..show(context).then((value){
                              Navigator.pop(context);
                            });
                          });
                        }
                        else{
                          Flushbar(
                            shouldIconPulse: true,
                            isDismissible: true,
                            flushbarPosition: FlushbarPosition.TOP,
                            titleText: Text("Submission Failed",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17.0),),
                            messageText: Text("Aadhar ,PAN & Voter Card are necessary for verification.",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15.0)),
                            duration: Duration(seconds: 5),
                            icon: Icon(Icons.error,color: Colors.white,),
                            backgroundColor: deepRed,
                          )..show(context).then((value){
                            setState(() {
                              submitting=false;
                            });
                          });
                        }
                      }
                      else{
                        Flushbar(
                          shouldIconPulse: true,
                          isDismissible: true,
                          flushbarPosition: FlushbarPosition.TOP,
                          titleText: Text("Already Active",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17.0),),
                          messageText: Text("Your Account is already active you don't need to submit any documents."
                              ,style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15.0)),
                          duration: Duration(seconds: 5),
                          icon: Icon(Icons.info,color: Colors.white,),
                          backgroundColor: Colors.blueAccent,
                        )..show(context).then((value){
                          setState(() {
                            submitting=false;
                          });
                        });
                      }

                    },
                    color: deepRed,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Submit",
                          style: GoogleFonts.balooBhaina(
                              fontSize: 22.0,
                              color: Colors.white),
                        ),
                        submitting?Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.white,),
                          ),
                        ):Container()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
