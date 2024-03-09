import 'package:flutter/material.dart';
import 'package:search_app/colorslist.dart';
import 'homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp (MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => ColorsList() ,
      child: MaterialApp(
        initialRoute: "Home Screen"  ,
        routes: {
          HomeScreen.routename : (context) => HomeScreen() ,
        },
        debugShowCheckedModeBanner: false ,
      ),
    ) ;
  }
}
