import 'package:first/screens/detail.dart';
import 'package:first/screens/home.dart';
import 'package:first/screens/login.dart';
import 'package:first/screens/profile.dart';
import 'package:first/screens/register.dart';
import 'package:first/screens/school.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/register': (context) => RegisterScreen(),
  '/login': (context) => LoginScreen(),
  '/home': (context) => HomeScreen(),
  '/detail': (context) => DetailScreen(),
  '/profile': (context) => ProfileScreen(),
  '/school': (context) => SchoolScreen(),
};
