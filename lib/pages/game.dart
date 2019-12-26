//import 'package:aa/pages/playgame.dart';
import 'dart:core' as prefix0;
import 'dart:core';

import 'package:date_utils/date_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotto_game/main.dart';
import 'package:lotto_game/pages/playgame.dart';
import 'package:shared_preferences/shared_preferences.dart';




class Game extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _GameState();
  }

}

class _GameState extends State<Game> with SingleTickerProviderStateMixin {
  var selectedDateTime;
  var selectedDate;

  //Animation<double> animation;
  Animation<double> animationtile;
  //AnimationController controller;
  AnimationController controllertile;
  var animationStatus;
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);

  TextEditingController _name = new TextEditingController();
  TextEditingController _money = new TextEditingController();
  bool aValue = false;
  bool checkValue = false;
  bool undo = true;
  String pattern="bad";
  String dropDownStringItem1="bad";
  var _Combination=['abc','cba','bca'];
  var _fullCombination=['abc','cba','bca'];
  var _currentItemSelected='rupees';
  var listofnames=['abc','cba','bca'];
  var listofmoney=['abc','cba','bca'];

//  _GameState(){
//  _getValue();
//}

  @override
  void initState() {
    super.initState();
//    controller =
//        AnimationController(duration: const Duration(seconds: 3), vsync: this);
//    animation = Tween<double>(begin: 0, end: 400).animate(controller)
//      ..addListener(() {
//        setState(() {
//          // The state that has changed here is the animation object’s value.
//        });
//      }) ..addStatusListener((state) => print('$state'))
//      ..addStatusListener((status){
//        animationStatus=status;
//      });
    controllertile =AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animationtile = Tween<double>(begin: 40, end: 400).animate(controllertile)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      })..addStatusListener((status){
        animationStatus=status;
      });
    //controller.forward();
          _getValue();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return
        Scaffold(
      appBar:topAppBar,
      body:SingleChildScrollView(
        child: Container(

          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (String userInput){
                  if(userInput.length<5){
                    _Combination=findAllPermutations(userInput);
                    debugPrint(_Combination[1]);
                    debugPrint(_Combination[0]);

                    _fullCombination=_Combination;
                    listofnames=_Combination;
                    listofmoney=_Combination;
                  }

                  setState(() {
                    pattern=userInput;
                  });
                },

              ),
              Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child:Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("your data is: $pattern",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),

                      Expanded(
                        child: RaisedButton(
                          child: Text("Get Value"),
                          onPressed: (){
                            _getAnimate();
                          },
                        ),
                      ),
                    ],
                  )
              ),
           Container(
             child: Column(
               children: <Widget>[
                 Wrap(
                   children: <Widget>[

                     GestureDetector(
                       child: Container(
                         color: Colors.yellow,
                         width: animationtile.value,
                         height: 200 ,
                         constraints: new BoxConstraints(
                           //maxHeight: 400.0,

                           maxHeight: animationtile.value ,
                           maxWidth:animationtile.value ,

                         ),
                         child: SingleChildScrollView(
                           reverse: true,
                           child :Column(
                             children: <Widget>[ Wrap(
                               children: _Combination.map((String text) {
                                 return new Chip(
                                   label: new Text(text,
                                     overflow: TextOverflow.ellipsis,),

                                   onDeleted: () {
                                     setState(() {
                                       _Combination.remove(text);
                                     });
                                   },
                                 );
                               }).toList(),
                             ),],
                           ),
                         ),
                       ),
                       onTap: () {
                         _getAnimate();
                         print('Now any click in this colored area will only trigger the GestureDetector, but make sure to set size depending on MediaQuery and textScaleFactor if you intend to use a Text Widget');
                       },
                     ),
                     GestureDetector(
                       child: Container(
                         color: Colors.red,
                         width: 80.0,

                         height: 40.0,
                         child: Icon(Icons.home),
                       ),
                       onTap: () {
                         controllertile.forward();
                         print('Now any click in this colored area will only trigger the GestureDetector, but make sure to set size depending on MediaQuery and textScaleFactor if you intend to use a Text Widget');
                       },
                     ),
                   ],

                 )
               ],
             ),
           ),


              Container(
                height: 1000,
                //child: _listView(),
                child: getListView(),
              ),

            ],
          ),
        ),
      ),
          bottomNavigationBar: makeBottom,
    );
  }
  final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    title: Text("Game"),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.list),
        onPressed: () {

        },
      )
    ],
  );



final makeBottom = Container(
    height: 55.0,
    child: BottomAppBar(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {


            },
          ),
          IconButton(
            icon: Icon(Icons.blur_on, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.hotel, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_box, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
    ),
  );

  Widget _listView(){
    return ListView.builder(
      itemCount: _Combination.length,
      itemBuilder: (context, pos) {
        return Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                child: Text(_Combination[pos], style: TextStyle(
                  fontSize: 18.0,
                  height: 1.6,

                ),

                ),

              ),

            ),

        );

      },

    );
  }



  Widget getListView(){


print("added here");

    var listView=ListView.builder(
        itemCount: _Combination.length ,
        itemBuilder: (context,index){

          return ListTile(
            leading: Icon(Icons.arrow_right),
            onTap: (){
            //  showSnackBar(context, _fullCombination[index],index);
              showSuccessDialog(index);




            },
            title: Text(_fullCombination[index]),
          );
        }
    );
    return listView;
  }
  Widget _showCalendar() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 8, right: 8),
      child: GestureDetector(
        onTap: () async {
          DateTime current = DateTime.now();
          final DateTime date = await showDatePicker(
              context: context,
              initialDate: current.add(new Duration(hours: 2)),
              firstDate: DateTime.now(),
              lastDate: DateTime(2021));

          if (date != null) {

            String date1=date.toString();
            List date2=date1.split(" ");

            selectedDateTime = date2[0];


            print(date2[0]);
            setState(() {});
          }
        },
        child: selectedDateTime != null ? new Text(selectedDateTime) : new Text("empty"),
      ),
    );
  }
  ////////////////////////

  void showSnackBar(BuildContext context,String data ,int position){
    var snackBar=SnackBar(
      content: Text("You just clicked $data "),
      action: SnackBarAction(
          label: "Undo",
          onPressed: (){
            debugPrint("Undo Performing");
          undo=false;

          setState(() {

          });
          }
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }



   _getValue() async {


      checkValue=await sharedPreferences.getBool('check');
    debugPrint("init  checkValue");
    print(checkValue);
      if(checkValue){
        _fullCombination=await sharedPreferences.getStringList('full_list');

        print(_fullCombination);
        debugPrint("init  hhhhhh");
        _Combination=await sharedPreferences.getStringList('mylist');

      }




  }
//alert dialoguebox
  showSuccessDialog(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)), //this right here
            child: Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: <Widget>[


                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          _Combination[index],
                          textAlign: TextAlign.center,

                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: <Widget>[

                            SizedBox(
                              height: 5,
                            ),
                            TextField(
                              controller: _name,
                              decoration: InputDecoration(
                                labelText: 'User Name',
                                hintText: 'Enter the mobile number',
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),


                            TextField(
                              controller: _money,
                              decoration: InputDecoration(
                                labelText: 'money',
                                hintText: 'Enter the money',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 15, right: 15, left: 15),
                        child: Text(
                          "",
                          textAlign: TextAlign.center,


                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                      onPressed: () async {
                        //do the work


                        setState(() {
                          sharedPreferences.clear();
                          checkValue = true;
                          sharedPreferences.setBool("check", checkValue);

                          debugPrint(_name.text);
                          debugPrint(_money.text);
                          _fullCombination[index]=_Combination[index]+" Name "+_name.text+" given "+_money.text;
                          sharedPreferences.setStringList("full_list", _fullCombination);
                          sharedPreferences.setStringList("mylist", _Combination);

                          print(_Combination);
                          _getValue();
                        });

                        Navigator.of(context, rootNavigator: true).pop(index);
                      },
          color:Color.fromARGB(0, 10, 20, 10),
                      child: Text("Save",


                    ),
                  ),
          ),

        ]
          )
          )
          );
        }
        );
  }


  void _getAnimate() {

    if (animationStatus == AnimationStatus.completed) {
      controllertile.reverse();
    } else if (animationStatus == AnimationStatus.dismissed) {
      controllertile.forward();
    }
  }

  @override
  void dispose() {
    controllertile.dispose();
    super.dispose();
  }
}



List<String> findAllPermutations(String source) {
  List allPermutations = [];

  void permutate(List list, int cursor) {
    // when the cursor gets this far, we've found one permutation, so save it
    if (cursor == list.length) {
      allPermutations.add(list);
      return;
    }

    for (int i = cursor; i < list.length; i++) {
      List permutation = new List.from(list);
      permutation[cursor] = list[i];
      permutation[i] = list[cursor];
      permutate(permutation, cursor + 1);
    }
  }

  permutate(source.split(''), 0);

  List<String> strPermutations = [];
  for (List permutation in allPermutations) {
    strPermutations.add(permutation.join());
  }

  return strPermutations;
}


