import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oshoorganiser/aeoui.dart';
import 'package:oshoorganiser/eventImg.dart';
import 'package:oshoorganiser/registerAshramImg.dart';
import 'package:oshoorganiser/widgets/custom_icons_icons.dart';
import 'package:progress_indicators/progress_indicators.dart';

String ashramImgUrl;
class RegisterYourAshram extends StatefulWidget {
  RegisterYourAshram({Key key,this.email,this.rememberMe}) : super(key: key);
  final String email;
  final bool rememberMe;
  @override
  _RegisterYourAshramState createState() => _RegisterYourAshramState();
}

class _RegisterYourAshramState extends State<RegisterYourAshram> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  bool registering=false;
  var rating;
  bool alreadyRegistered=false;
  final _formKey=GlobalKey<FormState>();
  bool activated=true;
  String ashramName;
  String desc;
  String loc;
  int price;
  @override
  void initState() {
    super.initState();
    Firestore.instance.collection("ashrams").document(widget.email).get().then((doc){
      if(doc.exists){
        setState(() {
          alreadyRegistered=true;
          _controller.text=doc.data['name'];
          _locationController.text=doc.data['location'];
          _priceController.text=doc.data['price'].toString();
          _descriptionController.text=doc.data['description'];
          ashramImgUrl=doc.data['image'].toString();

        });
      }
      else{
        setState(() {

          alreadyRegistered=false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Form(
          key: _formKey,
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder(
                  stream: Firestore.instance.collection("users").document(widget.email).snapshots(),
                  builder: (context, snapshot) {
                    return snapshot.hasData?
                    snapshot.data['activated']?SingleChildScrollView(
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
                                      "Register",
                                      style: GoogleFonts.aBeeZee(
                                          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 30.0),
                                    ),
                                    Text(
                                      "Ashram",
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
                                   Navigator.pop(context); /*Navigator.pushReplacement(context, MaterialPageRoute(
                                        builder: (context){
                                          return AeoUI(currentState: 0,username: widget.email,rememberMe: widget.rememberMe,);
                                        }
                                    ));*/
                                  },
                                )
                              ],),
                          ),

                          SizedBox(
                            height:12.0,
                          ),

                          //ashramName
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 8.0),
                            child: Material(
                              elevation: 12.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                              ),
                              child: TextFormField(
                                onChanged: (val){
                                  _formKey.currentState.validate();
                                },
                                validator: (val){
                                  if(val==""||val==null){
                                    return "Ashram Name Empty";
                                  }
                                  else{
                                    return null;
                                  }
                                },
                                decoration: new InputDecoration(
                                  labelText: "Ashram Name",
                                  border: InputBorder.none,
                                  errorStyle: GoogleFonts.balooBhaina(),
                                  labelStyle: GoogleFonts.balooBhaina(fontSize: 15),
                                  suffixIcon: Icon(CustomIcons.place_of_worship),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 8.0),
                                ),
                                controller: _controller,
                              ),
                            ),
                          ),
                          //image
                          ashramImgUrl!=""&&ashramImgUrl!=null?
                          Material(
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
                                    imageUrl: "$ashramImgUrl",
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
                                        heroTag: 2420,
                                        child: Icon(Icons.delete,color: deepRed,),
                                        backgroundColor: Colors.white,
                                        onPressed: (){
                                          setState(() {
                                            ashramImgUrl=null;
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                              :Padding(
                            padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 8.0),
                            child: Material(
                                color: Colors.blueAccent,
                                elevation: 12.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                ),
                                child: Container(
                                    width: MediaQuery.of(context).size.width*0.9,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:25.0,right:5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Upload Image",style: GoogleFonts.balooBhai(color: Colors.white,fontSize: 16.0),),
                                          IconButton(icon: Icon(Icons.camera_alt,color:Colors.white),
                                            onPressed: (){
                                              if(_controller.text!=""&&_controller.text!=null){
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
                                                              content: AshramImageCapture(widget.email),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }
                                                );
                                              }
                                              else{
                                                Flushbar(
                                                  shouldIconPulse: true,
                                                  isDismissible: true,
                                                  flushbarPosition: FlushbarPosition.TOP,
                                                  titleText: Text("Enter Ashram Name First",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17.0),),
                                                  messageText: Text("For Uploading Image we need a name for your Ashram",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15.0)),
                                                  duration: Duration(seconds: 3),
                                                  icon: Icon(Icons.error,color: Colors.white,),
                                                  backgroundColor:  deepRed,
                                                )..show(context);
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                    ))
                            ),
                          ),

                          //desc
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 8.0),
                            child: Material(
                              elevation: 12.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                              ),
                              child: TextFormField(
                                onChanged: (val){
                                  _formKey.currentState.validate();
                                },
                                validator: (val){
                                  if(val==""||val==null){
                                    return "Please enter description of atleast 4 lines";
                                  }
                                  else{
                                    return null;
                                  }
                                },

                                maxLines: 10,
                                minLines: 5,
                                decoration: new InputDecoration(
                                  labelText: "Description",
                                  border: InputBorder.none,
                                  errorStyle: GoogleFonts.balooBhaina(),
                                  labelStyle: GoogleFonts.balooBhaina(fontSize: 15),
                                  suffixIcon: Icon(Icons.speaker_notes),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 8.0),
                                ),
                                controller: _descriptionController,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 8.0),
                            child: Material(
                              elevation: 12.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                              ),
                              child: TextFormField(

                                onChanged: (val){
                                  _formKey.currentState.validate();
                                },
                                validator: (val){
                                  if(val==""||val==null){
                                    return "Location Undefined";
                                  }
                                  else{
                                    return null;
                                  }
                                },
                                maxLines: 4,
                                minLines: 2,
                                decoration: new InputDecoration(
                                  labelText: "Ashram Location",
                                  border: InputBorder.none,
                                  errorStyle: GoogleFonts.balooBhaina(),
                                  labelStyle: GoogleFonts.balooBhaina(fontSize: 15),
                                  suffixIcon: Icon(Icons.location_on),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 8.0),
                                ),
                                controller: _locationController,
                              ),
                            ),
                          ),

                          //price
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 8.0),
                            child: Material(
                              elevation: 12.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                              ),
                              child: TextFormField(
                                validator: (val){
                                  if(val==""||val==null){
                                    return "Price cannot be left empty";
                                  }
                                  else{
                                    return null;
                                  }
                                },
                                onChanged: (val){
                                  _formKey.currentState.validate();
                                },
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                  labelText: "Price per person per night",
                                  border: InputBorder.none,
                                  errorStyle: GoogleFonts.balooBhaina(),
                                  labelStyle: GoogleFonts.balooBhaina(fontSize: 15),
                                  suffixIcon: Icon(CustomIcons.rupee_sign,size: 16.0,),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 8.0),
                                ),
                                controller: _priceController,
                              ),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:14.0,vertical: 8.0),
                            child: Card(
                              elevation: 8.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text("Facilities and Accommodation",style: GoogleFonts.balooBhaina(color:Colors.grey,fontSize: 18)),
                                    subtitle: StreamBuilder<QuerySnapshot>(
                                      stream:Firestore.instance.collection("AshramFacilities").document("$loggedInEmail").collection("points").snapshots(),
                                      builder: (context, snapshot) {
                                        return snapshot.hasData?
                                        snapshot.data.documents.isNotEmpty?ListView.builder(
                                          shrinkWrap: true,
                                         itemCount: snapshot.data.documents.length,
                                         itemBuilder: (context,i){
                                            return PointCard(snapshot.data.documents.elementAt(i).data['point'],
                                                snapshot.data.documents.elementAt(i).data['id']);
                                         },
                                        ):Text("No Points Added",style: GoogleFonts.balooBhai(fontSize: 14),)

                                            :Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Center(child: Container(width:24,height: 24,child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.white,))),
                                        );
                                      }
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AddPointCard();
                                          });
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width*0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(12.0),bottomRight: Radius.circular(12)),
                                      ),
                                      child:Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal:5.0),
                                              child: Icon(Icons.add_comment,color: Colors.white,),
                                            ),
                                            Text("Add Points",style: GoogleFonts.balooBhaina(color:Colors.white,fontSize: 18),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:14.0,vertical: 8.0),
                            child: Card(
                              elevation: 8.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text("Terms and Conditions",style: GoogleFonts.balooBhaina(color:Colors.grey,fontSize: 18)),
                                    subtitle: StreamBuilder<QuerySnapshot>(
                                        stream:Firestore.instance.collection("AshramT&C").document("$loggedInEmail").collection("T&C").snapshots(),
                                        builder: (context, snapshot) {
                                          return snapshot.hasData?
                                          snapshot.data.documents.isNotEmpty?ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: snapshot.data.documents.length,
                                            itemBuilder: (context,i){
                                              return ConditionCard(snapshot.data.documents.elementAt(i).data['t&c'],
                                                  snapshot.data.documents.elementAt(i).data['id']);
                                            },
                                          ):Text("No Terms or Conditions Added",style: GoogleFonts.balooBhai(fontSize: 14),)

                                              :Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Center(child: Container(width:24,height: 24,child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.white,))),
                                          );
                                        }
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AddConditionCard();
                                          });
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width*0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(12.0),bottomRight: Radius.circular(12)),
                                      ),
                                      child:Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal:5.0),
                                              child: Icon(Icons.add_comment,color: Colors.white,),
                                            ),
                                            Text("Add Term or Condition",style: GoogleFonts.balooBhaina(color:Colors.white,fontSize: 18),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),


                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50.0,
                              color: deepRed,
                              child: Center(child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(alreadyRegistered?"Update":"Register",style: GoogleFonts.balooBhaina(fontSize: 20,color: Colors.white),),
                                  registering?Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 25,height: 25,
                                      child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.white,),
                                    ),
                                  ):Container()
                                ],
                              )),
                            ),
                            onTap: (){
                              setState(() {
                                registering=true;
                              });
                              if(ashramImgUrl!=null){
                                if(_formKey.currentState.validate()){
                                  List<String> terms=[];
                                  List<String> facilities=[];
                                  Firestore.instance.collection("AshramFacilities").document(loggedInEmail).collection("points").getDocuments().then((docs){
                                    for(int i=0;i<docs.documents.length;i++){
                                      facilities.add(docs.documents.elementAt(i).data['point'].toString());
                                    }
                                  });
                                  Firestore.instance.collection("AshramT&C").document(loggedInEmail).collection("T&C").getDocuments().then((docs){
                                    for(int i=0;i<docs.documents.length;i++){
                                      terms.add(docs.documents.elementAt(i).data['t&c'].toString());
                                    }
                                  });
                              Firestore.instance.collection("users").document(widget.email).get().then((doc){
                                    if(doc.exists){
                                      Firestore.instance.collection("ashrams").document(widget.email).setData({
                                        "name":_controller.text.trim(),
                                        "description":_descriptionController.text,
                                        "image":ashramImgUrl,
                                        "location":_locationController.text,
                                        "price":int.parse(_priceController.text),
                                        "rating":0.1,
                                        "email":widget.email,
                                        "reviews":[""].toList(),
                                        "facilities":facilities.toList(),
                                        "t&c":terms.toList(),
                                      },merge: true);
                                    }
                                  }).then((value){
                                    Flushbar(
                                      shouldIconPulse: true,
                                      isDismissible: true,
                                      flushbarPosition: FlushbarPosition.TOP,
                                      titleText: Text("Registration Complete",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17.0),),
                                      messageText: Text("People can now publicly seen your ashram Page",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15.0)),
                                      duration: Duration(seconds: 3),
                                      icon: Icon(Icons.check_circle,color: Colors.white,),
                                      backgroundColor:  Colors.green,
                                    )..show(context).then((value){
                                      setState(() {
                                        registering=false;
                                      });
                                      Navigator.pushReplacement(context, MaterialPageRoute(
                                          builder: (context){
                                            return AeoUI(currentState: 0,username: widget.email,rememberMe: widget.rememberMe,);
                                          }
                                      ));
                                    });
                                  });
                                }
                                else{
                                  setState(() {
                                    registering=false;
                                  });
                                }
                              }
                              else{
                                Flushbar(
                                  shouldIconPulse: true,
                                  isDismissible: true,
                                  flushbarPosition: FlushbarPosition.TOP,
                                  titleText: Text("Registration Failed",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17.0),),
                                  messageText: Text("Please fill up the required fields.",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15.0)),
                                  duration: Duration(seconds: 3),
                                  icon: Icon(Icons.error,color: Colors.white,),
                                  backgroundColor:  deepRed,
                                )..show(context).then((value){
                                  setState(() {
                                    registering=false;
                                  });
                                });
                              }
                            },
                          )
                        ],
                      ),
                    ):
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Text("Your Account has not been Verified.Please go to the Profile section and"
                                " tap on Document Verification to Submit necessary Documents and within 24 hrs your account will be active, provided you submitted the documents Correctly."
                              ,style: GoogleFonts.aBeeZee(fontSize: 20,color: Colors.black54),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 32),
                          child: RaisedButton(
                            color: deepRed,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child:Text("Go Back",style: GoogleFonts.balooBhai(fontSize: 16,color: Colors.white) ,),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    )
                    :Center(child: CircularProgressIndicator());
                  }
              )
          ),
        ),
      ),
    );
  }
}




class AddConditionCard extends StatefulWidget {
  @override
  _AddConditionCardState createState() => _AddConditionCardState();
}

class _AddConditionCardState extends State<AddConditionCard> {
  final pointController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context,setState){
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          content:Container(
            height: MediaQuery.of(context).size.height*0.6,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(Icons.add_comment,size: 25,color: Colors.blueAccent,),
                                  ),
                                  Text("Add T&C",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600),),
                                ],
                              ),
                              IconButton(
                                icon: Icon(Icons.close,color: Colors.red,),
                                onPressed: ()=>Navigator.pop(context),
                              )
                            ],
                          ),
                          Container(
                            height: 400.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Material(
                                        elevation: 5.0,
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        child: TextFormField(
                                          style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045,color:Colors.black,fontWeight: FontWeight.w700),
                                          validator: (String value){
                                            if(value==null||value==""){
                                              return "Please Enter Something";
                                            }
                                            else{
                                              return null;
                                            }
                                          },
                                          onChanged: (String v){
                                            _formKey.currentState.validate();
                                          },
                                          maxLines: 5,
                                          keyboardType: TextInputType.text,
                                          controller: pointController,
                                          decoration: InputDecoration(
                                            labelText: "Add T&C",
                                            errorStyle: GoogleFonts.balooBhaina(),
                                            labelStyle:TextStyle(fontSize: MediaQuery.of(context).size.width*0.045),
                                            contentPadding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 5.0),
                                            suffixIcon: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(Icons.rate_review,color: Colors.black,),
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),


                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Text("Add",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                    ),
                    color:  Color.fromRGBO(253, 11, 23, 1),
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        Firestore.instance.collection("AshramT&C").document("$loggedInEmail").collection("T&C").add({
                          "t&c":pointController.text,
                        }).then((value) => Firestore.instance.collection("AshramT&C").document("$loggedInEmail").collection("T&C")
                            .document(value.documentID).updateData({"id":value.documentID}));
                        Navigator.pop(context);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class ConditionCard extends StatefulWidget {
  final String point,id;
  ConditionCard(this.point, this.id);
  @override
  _ConditionCardState createState() => _ConditionCardState();
}

class _ConditionCardState extends State<ConditionCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading:Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(Icons.info),
        ),
        trailing: IconButton(icon: Icon(Icons.delete,color:deepRed,),
          onPressed: (){
            Firestore.instance.collection("AshramT&C").document("$loggedInEmail").collection("T&C").document(widget.id).delete();
          },),
        title:Text(widget.point,style: GoogleFonts.aBeeZee(color:Colors.grey,fontSize: 16),)
    );
  }
}



class PointCard extends StatefulWidget {
  final String point,id;
  PointCard(this.point, this.id);
  @override
  _PointCardState createState() => _PointCardState();
}

class _PointCardState extends State<PointCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading:Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(Icons.stars),
        ),
        trailing: IconButton(icon: Icon(Icons.delete,color:deepRed,),
        onPressed: (){
            Firestore.instance.collection("AshramFacilities").document("$loggedInEmail").collection("points").document(widget.id).delete();
        },),
        title:Text(widget.point,style: GoogleFonts.aBeeZee(color:Colors.grey,fontSize: 16),)
    );
  }
}

class AddPointCard extends StatefulWidget {
  @override
  _AddPointCardState createState() => _AddPointCardState();
}

class _AddPointCardState extends State<AddPointCard> {
  final pointController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context,setState){
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          content:Container(
            height: MediaQuery.of(context).size.height*0.6,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(Icons.add_comment,size: 25,color: Colors.blueAccent,),
                                  ),
                                  Text("Add Facility",style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600),),
                                ],
                              ),
                              IconButton(
                                icon: Icon(Icons.close,color: Colors.red,),
                                onPressed: ()=>Navigator.pop(context),
                              )
                            ],
                          ),
                          Container(
                            height: 400.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Material(
                                        elevation: 5.0,
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        child: TextFormField(
                                          style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045,color:Colors.black,fontWeight: FontWeight.w700),
                                          validator: (String value){
                                            if(value==null||value==""){
                                              return "Please Enter Something";
                                            }
                                            else{
                                              return null;
                                            }
                                          },
                                          onChanged: (String v){
                                            _formKey.currentState.validate();
                                          },
                                          maxLines: 5,
                                          keyboardType: TextInputType.text,
                                          controller: pointController,
                                          decoration: InputDecoration(
                                            labelText: "Add a Point",
                                            errorStyle: GoogleFonts.balooBhaina(),
                                            labelStyle:TextStyle(fontSize: MediaQuery.of(context).size.width*0.045),
                                            contentPadding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 5.0),
                                            suffixIcon: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(Icons.rate_review,color: Colors.black,),
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),


                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Text("Add",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                    ),
                    color:  Color.fromRGBO(253, 11, 23, 1),
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        Firestore.instance.collection("AshramFacilities").document("$loggedInEmail").collection("points").add({
                          "point":pointController.text,
                        }).then((value) => Firestore.instance.collection("AshramFacilities").document("$loggedInEmail").collection("points")
                        .document(value.documentID).updateData({"id":value.documentID}));
                        Navigator.pop(context);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


