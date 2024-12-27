import 'package:flutter/material.dart';
import 'package:heritage_app/screens/home.dart';
import 'package:heritage_app/screens/more_feature.dart';
import 'package:heritage_app/screens/shopping.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: ChatbotScreen(),
    // home: ShoppingScreen(),
    home: HomeScreen(),
    // home: MoreFeatureScreen(),
  ));
}
