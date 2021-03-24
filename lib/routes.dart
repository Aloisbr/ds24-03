import 'package:dwm14/screens/detail.dart';
import 'package:dwm14/screens/home.dart';
import 'package:dwm14/screens/login.dart';
import 'package:dwm14/screens/userInfos.dart';
import 'package:dwm14/screens/register.dart';
import 'package:dwm14/screens/school.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/register': (context) => RegisterScreen(),
  '/login': (context) => LoginScreen(),
  '/home': (context) => HomeScreen(),
  '/detail': (context) => DetailScreen(),
  '/user/infos': (context) => UserScreen(),
  '/school': (context) => SchoolScreen(),
};
