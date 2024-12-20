import 'package:flutter/material.dart';
import 'package:heritage_app/screens/home.dart';
import 'package:heritage_app/screens/more_feature.dart';

void main() {
  runApp( const MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: ChatbotScreen(),
    home: HomeScreen(),
    // home: MoreFeatureScreen(),
  ));
}
