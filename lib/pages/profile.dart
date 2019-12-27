import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateMyProfile();
  }

}

class _StateMyProfile extends State<MyProfile> with SingleTickerProviderStateMixin {
int k=0;
  bool _status = true;
  bool _compstatus = true;
  final FocusNode myFocusNode = FocusNode();

@override
Widget build(BuildContext context) {
  return new Scaffold(
    appBar: buildAppBar(context),
      body:homeProfileView(),

  );
}




  Widget buildAppBar(BuildContext context) {
    return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
      new IconButton(
        icon: icon,

      ),
    ]);
  }

  Widget homeProfileView(){
  return Stack(
    children: <Widget>[
      ClipPath(
        child: Container(color: Colors.lightBlueAccent.withOpacity(0.8)),
        clipper: getClipper(),
      ),

      Padding(
        padding: EdgeInsets.only(top: 60.0),
        child: new Stack(fit: StackFit.loose, children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                  width: 140.0,
                  height: 140.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      image:NetworkImage(
                          'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                      fit: BoxFit.cover,
                    ), //https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg//https://scontent.fdel1-3.fna.fbcdn.net/v/t31.0-8/p960x960/16251695_1315894128477326_6580575096860760232_o.jpg?_nc_cat=111&_nc_ohc=JS66eeL3kD0AQmt0gFwNWzlxdHHub3_axzTbrLW5CpJfUK3m7ijB1FGBA&_nc_ht=scontent.fdel1-3.fna&oh=cee8cba34293829cf32091a8e530edf1&oe=5EB26391
                  )),
            ],
          ),

          Padding(
              padding: EdgeInsets.only(top: 90.0, right: 100.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 25.0,
                    child: new Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  )
                ],
              )
          ),
        ]),
      ),
      Padding(
        padding: EdgeInsets.only(top: 20.0, left: 30.0),
        child:new IconButton(
          color: Colors.lightBlue,
          iconSize: 40,
          icon:Icon(Icons.menu) ,
          onPressed: (){

          },
        ),
      ),
      Positioned( top: 20,right: 25,
        child:new IconButton(
          color: Colors.lightBlue,
          iconSize: 40,
          icon:Icon(Icons.settings) ,
          onPressed: (){

          },
        ),
      ),

      Padding(
          padding: EdgeInsets.only(top: 220, right: 10.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _status ? _getEditIcon() : new Container(),
                ],
              ),
              Text(
                'Tom Cruise',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ],
          )
      ),
      Padding(
        padding: EdgeInsets.only(top: 340.0, right: 20.0,left: 20),
        child:SingleChildScrollView(
          child:new Container(

            child: _status ?  _getActionView() : _getActionEdit(),
          ) ,
        ) ,
      ),
      Padding(
        padding: const EdgeInsets.only(left:20,top:259.0,right: 20),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width ,
          child: Stack(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.ltr,
                children: <Widget>[

                  Expanded(
                    child: Card(
                      elevation: 15,
                      child: Column(
                        children: <Widget>[

                          Expanded(child: Center(child:
                          Text("1234",
                            style: TextStyle(fontSize: 30),
                          )
                          ),
                          ),
                          Expanded(child: Center(child: Text("Agent ID",style: TextStyle(color: Colors.grey),
                          )
                          )
                          ),

                        ],
                      ),
                    ),
                  ),



                  Expanded(
                    child: Card(
                      elevation: 15,
                      child: Column(
                        children: <Widget>[
                          Expanded(child: Center(child: Text("5",style: TextStyle(fontSize: 30),))),
                          Expanded(child: Center(child: Text("Total Visa",style: TextStyle(color: Colors.grey),))),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 15,
                      child: Column(
                        children: <Widget>[
                          Expanded(child: Center(child: Text("12",style: TextStyle(fontSize: 30),))),
                          Expanded(child: Center(child: Text("Total Travel",style: TextStyle(color: Colors.grey),))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),





    ],
  );
  }

  Widget appBarTitle = new Text(
    "Profile",
    style: new TextStyle(color: Colors.white),
  );
  Icon icon = new Icon(
    Icons.account_circle,
    color: Colors.white,
  );

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }
//////textview/////////
  Widget _getActionView() {
    return  Padding(
      padding: EdgeInsets.only(bottom: 25.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 25.0),
              child: Center(
                child: Text(
                          'Your Information',
                          style: TextStyle(color: Colors.blueAccent,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,),
                        ),
              ),

          ),


          Padding(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 25.0),
              child: Center(
                child: Text(
                          'aymen@gmail.com',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
              ),

          ),

          Padding(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 15.0),
              child:Center(
                child: Text(
                          '+919400497367',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
              ),

          ),

          Padding(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 25.0),
              child: new Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Container(

                      child: new Text(
                        'Visa Details',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                  ),
                  Expanded(

                    child: Container(

                      alignment: Alignment.centerRight,
                      child: new Text(
                        'Agent ID',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                  ),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 5.0),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: new Text(
                        'Dubai Visa 30days',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: new Text(
                        '6543334',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              )),

          ////pan passport
          Padding(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 25.0),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: new Text(
                        'PAN Number',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: new Text(
                        'Passport',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 5.0),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: new Text(
                        'DFGH4567',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: new Text(
                        'L45678',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              )),
          //passport Expiry visa expiry date
          Padding(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 25.0),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: new Text(
                        'Passport Expiry',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: new Text(
                        'Visa Expiry',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 5.0),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: new Text(
                        '25-2-2023',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: new Text(
                        '23-5-2024',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              )
          ),
          !_status ? _getActionButtons() : new Container(),
        ],
      ),
    );
  }
  ////////////_getActionEdit///////////
Widget _getActionEdit() {
  return  Padding(
    padding: EdgeInsets.only(bottom: 25.0),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 25.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      'Your Information',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

              ],
            )),
        Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 25.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            )),
        Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 2.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Flexible(
                  child: new TextField(
                    decoration: const InputDecoration(
                      hintText: "Enter Your Name",
                    ),
                    enabled: !_status,
                    autofocus: !_status,

                  ),
                ),
              ],
            )),
        Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 25.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      'Email ID',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            )),
        Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 2.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Flexible(
                  child: new TextField(
                    decoration: const InputDecoration(
                        hintText: "Enter Email ID"),
                    enabled: !_status,
                  ),
                ),
              ],
            )),
        Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 25.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      'Mobile',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            )),
        Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 2.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Flexible(
                  child: new TextField(
                    decoration: const InputDecoration(
                        hintText: "Enter Mobile Number"),
                    enabled: !_status,
                  ),
                ),
              ],
            )
        ),
        Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 25.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: new Text(
                      'Visa Details',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(
                    child: new Text(
                      'Agent ID',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  flex: 2,
                ),
              ],
            )),
        Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 2.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: new TextField(
                      decoration: const InputDecoration(
                          hintText: "Enter Visa details"),
                      enabled: !_status,
                    ),
                  ),
                  flex: 2,
                ),
                Flexible(
                  child: new TextField(
                    decoration: const InputDecoration(
                        hintText: "Enter Agent ID"),
                    enabled: !_status,
                  ),
                  flex: 2,
                ),
              ],
            )),
        ////pan passport
        Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 25.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: new Text(
                      'PAN Number',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(
                    child: new Text(
                      'Passport',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  flex: 2,
                ),
              ],
            )),
        Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 2.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: new TextField(
                      decoration: const InputDecoration(
                          hintText: "Enter PAN Number"),
                      enabled: !_status,
                    ),
                  ),
                  flex: 2,
                ),
                Flexible(
                  child: new TextField(
                    decoration: const InputDecoration(
                        hintText: "Enter Passport Details"),
                    enabled: !_status,
                  ),
                  flex: 2,
                ),
              ],
            )),
        //passport Expiry visa expiry date
        Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 25.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: new Text(
                      'Passport Expiry',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(
                    child: new Text(
                      'Visa Expiry',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  flex: 2,
                ),
              ],
            )),
        Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 2.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: new TextField(
                      decoration: const InputDecoration(
                          hintText: "Enter Passport Expiry"),
                      enabled: !_status,
                    ),
                  ),
                  flex: 2,
                ),
                Flexible(
                  child: new TextField(
                    decoration: const InputDecoration(
                        hintText: "Enter Visa Expiry"),
                    enabled: !_status,
                  ),
                  flex: 2,
                ),
              ],
            )
        ),
        !_status ? _getActionButtons() : new Container(),
      ],
    ),
  );
}


//////////////////

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Save"),
                    textColor: Colors.white,
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      setState(() {

                          _status = true;

                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;

                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {

      _status = false;


        });
      },
    );
  }
}
class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 4);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}