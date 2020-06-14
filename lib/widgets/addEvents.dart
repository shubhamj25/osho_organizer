import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:oshoorganiser/aeoui.dart';
import 'package:oshoorganiser/eventImg.dart';
import 'package:oshoorganiser/widgets/addOffers.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../profileImg.dart';
import '../userProfilePafe.dart';
import 'custom_icons_icons.dart';

String eventImgUrl;
class AddEvents extends StatefulWidget {
  AddEvents({Key key,this.email,this.rememberMe}) : super(key: key);
  final String email;
  bool rememberMe;
  @override
  _AddEventsState createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {
  List cards = List();
  TextEditingController _controller = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

 bool registering=false;
  String _selectedDate = 'Start';
  String _selectedDateTwo = 'End';
  var rating;

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
  final _formKey=GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventImgUrl=null;
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
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => AddEvents()));
        if (index == 2)
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => UserProfileUI(widget.email,widget.rememberMe)));
      });
    }
    final List<Widget> _children = [AeoUI(), AddEvents(), AeoUI()];
    return Scaffold(
      body:Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
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
                            "Event",
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Text(_selectedDate,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.balooBhai(fontSize:18,color: Colors.black54)),
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
                          style: GoogleFonts.balooBhai(fontSize:18,color: Colors.black54)),
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
                SizedBox(
                  height:12.0,
                ),
                //eventName
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
                          return "Event Name Empty";
                        }
                        else{
                          return null;
                        }
                      },
                      decoration: new InputDecoration(
                        labelText: "Event Name",
                        border: InputBorder.none,
                        errorStyle: GoogleFonts.balooBhaina(),
                        labelStyle: GoogleFonts.balooBhaina(fontSize: 15),
                        suffixIcon: Icon(Icons.event),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 8.0),
                      ),
                      controller: _controller,
                    ),
                  ),
                ),
                //image
                eventImgUrl!=""&&eventImgUrl!=null?
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
                             imageUrl: "$eventImgUrl",
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
                                      eventImgUrl=null;
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
                                                content: EventImageCapture(widget.email,_controller.text.trim()),
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
                                    titleText: Text("Enter Event Name First",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17.0),),
                                    messageText: Text("For Uploading Image we need an event name",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15.0)),
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
                        labelText: "Location of Event",
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FadingText("Long Press to Register Event",style: GoogleFonts.aBeeZee(fontSize: 18),),
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    color: deepRed,
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Register",style: GoogleFonts.balooBhaina(fontSize: 20,color: Colors.white),),
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
                  onLongPress: (){
                    setState(() {
                      registering=true;
                    });
                    if(_selectedDate!='Start'&&_selectedDateTwo!='End'&&eventImgUrl!=null){
                      if(_formKey.currentState.validate()){
                        Firestore.instance.collection("users").document("organizer").collection("users").document(widget.email).get().then((doc){
                          if(doc.exists){
                            Firestore.instance.collection("events").document(_controller.text.trim()).setData({
                              "title":_controller.text.trim(),
                              "ashram":doc.data['ashram'],
                              "start":_selectedDate,
                              "end":_selectedDateTwo,
                              "description":_descriptionController.text,
                              "imageUrl":eventImgUrl,
                              "price":int.parse(_priceController.text),
                              "location":_locationController.text,
                              "favourite":false,
                              "rating":0.1,
                              "email":widget.email,
                              "reviews":[""].toList(),
                              "postedOn":DateTime.now().toIso8601String(),
                            },merge: true);
                          }
                        }).then((value){
                          Flushbar(
                            shouldIconPulse: true,
                            isDismissible: true,
                            flushbarPosition: FlushbarPosition.TOP,
                            titleText: Text("Event Created",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17.0),),
                            messageText: Text("Event has been created publicly using the entered details",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15.0)),
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
                        titleText: Text("Event not Created",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17.0),),
                        messageText: Text("Dates or Event Pics Missing",style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15.0)),
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
          ),
        ),
      ),
      /*floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.arrow_forward),
          backgroundColor: new Color(0xFFE57373),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => AddOffers()));
          }),*/
    );
  }
}

