import 'package:flutter/material.dart';
import 'package:lotto_game/pages/game.dart';
import 'package:lotto_game/pages/profile.dart';
import 'package:lotto_game/pages/test.dart';
import 'package:lotto_game/pages/test2.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences sharedPreferences;

Future main() async {
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(
      MaterialApp(
        title: "Factorial Game",
      // home: ProfilePage(),
       home: MyProfile(),
      // home: MyHomePage(),



      ));
}


