import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oshoorganiser/eventOrganiser.dart';
import 'package:oshoorganiser/subscriptioncallingpage.dart';
import 'package:oshoorganiser/userProfilePafe.dart';
import 'package:oshoorganiser/widgets/addEvents.dart';
import 'package:oshoorganiser/widgets/custom_icons_icons.dart';
import 'package:oshoorganiser/widgets/customshape.dart';
import 'package:oshoorganiser/widgets/otherDetails.dart';
import 'bookingforManager.dart';
import 'constant/constant.dart';
import 'insideHotelPage.dart';
import 'model/aeospecials.dart';
import 'model/aeowordlist.dart';
import 'model/arealocationlist.dart';
import 'model/exploreaeohotelslist.dart';
import 'model/latestaeo.dart';
import 'model/limitedperiodofferlist.dart';
import 'model/readyforsummerlist.dart';
import 'model/weekendgetawayslist.dart';
import 'model/yourwalletslist.dart';
import 'newLoginscreen2.dart';
import 'organiserPageNotifications.dart';

String loggedInEmail;
String loggedInPassword;
Color deepRed=Color.fromRGBO(253, 11, 23, 1);


class HomePage extends StatefulWidget {
  final String username;
  bool rememberMe;
  HomePage({this.username,this.rememberMe});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _width;
  double _height;
  List<AreaLocationList> areaLocationList;
  List<ReadyForSummerList> readyForSummer;
  List<LimitedPeriodOfferList> limitedPeriodOffer;
  List<ExploreOyoHotelsList> exploreOyoHotels;
  List<WeekendGetawaysList> weekendGetaways;
  List<oyoWordList> oyoWord;
  List<OyoSpecialsList> oyoSpecials;
  List<LatestOyoList> latestOyo;
  List<YourWalletList> yourWallets;
  Widget _buildLocationList(AreaLocationList item) {
    return Container(
      color: Colors.white,
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(70.0),
              child: Image.asset(
                item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              item.name,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                  color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYourWalletsList(YourWalletList item) {
    return Container(
        width: _width / 1.5,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Card(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          color: Colors.orange[100],
          child: Stack(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Opacity(
                opacity: 0.75,
                child: ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    height: _height / 8,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange[200], Colors.pinkAccent],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Column(
                children: <Widget>[
                  Opacity(
                    opacity: 0.5,
                    child: ClipPath(
                      clipper: CustomShapeClipper2(),
                      child: Container(
                        //height: _height / 3.5,
                        height: _height / 7.8,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue[500], Colors.pinkAccent],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Text(
                          item.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            item.subTitleRupee,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: Image.asset(
                            item.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 150,
                    ),
                    child: Container(
                      alignment: Alignment.topLeft,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          item.totalRupee,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }

  Widget _buildLatestAeoList(LatestOyoList item) {
    return Container(
      width: _width / 2.1,
      child: Card(
        elevation: 0,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                child: Image.asset(
                  item.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  item.name,
                  style: TextStyle(
                      fontSize: 13,
                      letterSpacing: 0.1,
                      height: 1.5,
                      fontWeight: FontWeight.w600),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAeoSpecialsList(OyoSpecialsList item) {
    return Container(
      width: _width / 2.20,
      child: Card(
        elevation: 2,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                child: Container(
                  child: Image.asset(
                    item.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.title,
                      style:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.subTitle,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                          letterSpacing: 0.1,
                          height: 1.5),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekendGetawaysList(WeekendGetawaysList item) {
    return Container(
      width: _width / 2.4,
      child: Card(
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5)),
          child: Image.asset(
            item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildExploreAeoHotelsList(ExploreOyoHotelsList item) {
    return Container(
      width: _width / 2.20,
      child: Card(
        elevation: 2,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                child: Image.asset(
                  item.imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.black,
              height: _height / 30,
              width: _width / 5,
              child: Text(
                item.title,
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  item.subTitle,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      letterSpacing: 0.1,
                      height: 1.5),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLimitedPeriodList(LimitedPeriodOfferList item) {
    return Container(
      width: _width / 2.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Card(
          elevation: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
            child: Image.asset(
              item.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummerList(ReadyForSummerList item) {
    return Container(
      width: _width,
      child: Card(
        elevation: 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            item.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    areaLocationList = Constants.getLocationList();
    readyForSummer = Constants.getSummerList();
    limitedPeriodOffer = Constants.getLimitedPeriodOfferList();
    exploreOyoHotels = Constants.getExploreOyoHotelsList();
    weekendGetaways = Constants.getWeekendsList();
    oyoSpecials = Constants.getOyoSpecials();
    latestOyo = Constants.getLatestOyo();
    yourWallets = Constants.getYourWallet();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery
        .of(context)
        .size
        .height;
    _width = MediaQuery
        .of(context)
        .size
        .width;
    int _currentIndex = 0;
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.red,
                    Colors.redAccent,
                    Colors.red.shade400
                  ])),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:12.0),
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(70)),
                      elevation: 10,
                      child: Image.asset(
                        'assets/images/drawerimage.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Text(
                      "Organizer",
                      style: GoogleFonts.laBelleAurore(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                  Text(
                    "Welcome to Osho",
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                  Text(
                    "$loggedInEmail",
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
            CustomListview(
                Icons.person,
                " Dashboard ",
                    () =>
                {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => AeoUI(currentState: 0,username: widget.username,rememberMe: widget.rememberMe,)))
                }),
            CustomListview(
                Icons.rate_review,
                "Registration Form",
                    () =>
                {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => OtherDetails()))
                }),
            CustomListview(
                Icons.contact_mail,
                "Organiser Registration",
                    () =>
                {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => EventOrganiser()))
                }),
            CustomListview(
                Icons.wc,
                "Booking",
                    () =>
                {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => BookingPage(email: widget.username,rememberMe: widget.rememberMe,)))
                }),


            CustomListview(
                Icons.offline_bolt,
                "LogOut",
                    () =>
                {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          NewLoginScreenTwo()))
                }),
          ],
        ),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: _height / 5,
                floating: true,

                actions: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 15),
                      child: IconButton(
                        icon: Icon(Icons.notifications_active),
                        onPressed: () {
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  OrganiserNotifications()));
                        }, //notification Page of the consumer
                      ))
                ],
                backgroundColor: deepRed,//Color.fromARGB(255, 196, 26, 61),
                //#f02730
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  centerTitle: true,
                  titlePadding: EdgeInsets.only(top: 5.0),
                  title: Center(
                    child: Text(
                      "Osho Organizer",
                      style: GoogleFonts.laBelleAurore(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                        left: 20,
                        right: 20,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: _width,
                      height: _height / 14,
                      alignment: Alignment.topCenter,
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.grey,
                            ),
                            hintText: "Search for Hotel, City or Location",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 13.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    preferredSize: Size(_width, _height / 20)),
              ),
            ];
          },


          body:SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: _height / 6,
                  child: ListView.builder(
                      itemCount: areaLocationList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildLocationList(areaLocationList[index]);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Live Events",style: GoogleFonts.balooBhai(fontSize: 25,color: Colors.black45),textAlign: TextAlign.center,),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance.collection("events").snapshots(),
                    builder: (context, snapshot) {
                      currentEvents.clear();
                      if(snapshot.hasData){
                            for(int i=0;i<snapshot.data.documents.length;i++){
                              if(snapshot.data.documents.elementAt(i).data['email']==widget.username){
                                currentEvents.add(LiveEventCard(snapshot.data.documents.elementAt(i).data['title'],
                                    snapshot.data.documents.elementAt(i).data['imageUrl'],
                                    snapshot.data.documents.elementAt(i).data['description'],
                                    snapshot.data.documents.elementAt(i).data['location']
                                ));
                              }
                            }
                      }
                      return snapshot.hasData ?
                      currentEvents.isNotEmpty?Column(
                        children:currentEvents,
                      ):Text("No Current Live Events",style: GoogleFonts.balooBhai(fontSize: 18,color: Colors.black26),)

                          :
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Container(
                          height: 27,width: 27,
                          child:CircularProgressIndicator(
                            strokeWidth: 2,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      );
                    }
                ),
              ],
            ),
          )
      ),
    );
  }
}


List<LiveEventCard> currentEvents=[];

class AeoUI extends StatefulWidget {
  final String username;
  final int currentState;
  final bool rememberMe;
  AeoUI({this.username,this.currentState, this.rememberMe});
  @override
  _AeoUIState createState() => _AeoUIState();
}

class _AeoUIState extends State<AeoUI> {
  double _width;
  double _height;
  List<AreaLocationList> areaLocationList;
  List<ReadyForSummerList> readyForSummer;
  List<LimitedPeriodOfferList> limitedPeriodOffer;
  List<ExploreOyoHotelsList> exploreOyoHotels;
  List<WeekendGetawaysList> weekendGetaways;
  List<oyoWordList> oyoWord;
  List<OyoSpecialsList> oyoSpecials;
  List<LatestOyoList> latestOyo;
  List<YourWalletList> yourWallets;

  @override
  void initState() {
    super.initState();
    areaLocationList = Constants.getLocationList();
    readyForSummer = Constants.getSummerList();
    limitedPeriodOffer = Constants.getLimitedPeriodOfferList();
    exploreOyoHotels = Constants.getExploreOyoHotelsList();
    weekendGetaways = Constants.getWeekendsList();
    oyoSpecials = Constants.getOyoSpecials();
    latestOyo = Constants.getLatestOyo();
    yourWallets = Constants.getYourWallet();
  }
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    List<Widget> pages=[HomePage(username: widget.username,rememberMe: widget.rememberMe,),AddEvents(email: widget.username,rememberMe: widget.rememberMe,),UserProfileUI(widget.username,widget.rememberMe)];
    return SafeArea(
      child: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Color.fromRGBO(253, 11, 23, 1),
                  ),
                  title: Text("Home",style: GoogleFonts.balooBhai(fontSize: 15))),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                    color: Color.fromRGBO(253, 11, 23, 1),
                  ),
                  title: Text("Add Events",style: GoogleFonts.balooBhai(fontSize: 15))),


              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Color.fromRGBO(253, 11, 23, 1),
                  ),
                  title: Text("Profile",style: GoogleFonts.balooBhai(fontSize: 15))),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex=index;
              });
            }
            ),
      ),
    );
  }


}

class CustomListview extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;
  CustomListview(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.redAccent))),
        child: InkWell(
          splashColor: Colors.redAccent,
          onTap: onTap,
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      icon,
                      color: Colors.red,
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      text,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.red,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LiveEventCard extends StatefulWidget {
  final String imageUrl,title,description,location;
  LiveEventCard(this.title,this.imageUrl, this.description, this.location);
  @override
  _LiveEventCardState createState() => _LiveEventCardState();
}

class _LiveEventCardState extends State<LiveEventCard> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 6.0),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  fadeInDuration: Duration(milliseconds: 500),
                  fadeInCurve: Curves.easeIn,
                  imageBuilder: (context, imageProvider) => Container(
                    width:350,
                    height: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight:Radius.circular(12.0),topLeft:Radius.circular(12.0)),
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(Colors.black26,BlendMode.darken),
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => Padding(
                    padding: const EdgeInsets.symmetric(vertical:40.0),
                    child: Center(child: Container(height:25,width: 25,child: CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.white,))),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(
                  height: 10.0,
                ),

                Positioned(
                  top:8.0,
                  left: MediaQuery.of(context).size.width*0.5,
                  child: RaisedButton(
                    elevation: 12.0,
                    color:Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              HotelDetailsPage(eventName: widget.title,)));
                    },
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(CustomIcons.info_circle,size: 16,color: Colors.white,),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Details",style: GoogleFonts.balooBhai(fontSize:16.0,color: Colors.white),),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top:8.0,
                  right: MediaQuery.of(context).size.width*0.48,
                  child: RaisedButton(
                    elevation: 12.0,
                    color:deepRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    onPressed: ()=>null,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.check,size:16,color: Colors.white,),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Ongoing",style: GoogleFonts.balooBhai(fontSize:16.0,color: Colors.white),),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top:110.0,
                  right: 20,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: FloatingActionButton(
                      child: Icon(Icons.delete,color: deepRed,),
                      heroTag: widget.title.hashCode,
                      backgroundColor: Colors.white,
                      onPressed: (){
                        Firestore.instance.collection("events").document(widget.title).delete();
                      },
                    ),
                  )
                ),
                Container(
                  width: 200.0,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.title,
                        style: GoogleFonts.aBeeZee(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading:Icon(Icons.event),
                        title:Text("Description",  style: GoogleFonts.balooBhai(fontSize: 18),),
                        subtitle: Text("${widget.description}",
                          style: GoogleFonts.raleway(fontSize: 16),
                        ),
                      ),
                      ListTile(
                        leading:Icon(Icons.location_on),
                        title:Text("Location",  style: GoogleFonts.balooBhai(fontSize: 18),),
                        subtitle: Text("${widget.location}",
                          style: GoogleFonts.raleway(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}