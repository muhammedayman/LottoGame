import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalenderAnimation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateCalenderAnimation();
  }

}

class _StateCalenderAnimation extends State<CalenderAnimation> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: buildAppBar(context),
      body:SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                  onPressed: (){

              },

              )
            ],
          ),
        ),
      )
    );
  }











  Widget buildAppBar(BuildContext context) {
    return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
      new IconButton(
        icon: icon,

      ),
    ]);
  }

  Widget appBarTitle = new Text(
    "Search Example",
    style: new TextStyle(color: Colors.white),
  );
  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );

}