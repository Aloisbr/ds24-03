import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:dwm14/models/movie.dart';
import 'package:dwm14/models/user.dart';

final firebaseAuth = FirebaseAuth.instance;

final firestore = FirebaseFirestore.instance;

isLogged() {
  return firebaseAuth.currentUser;
}

getMovies() async {
  List result = [];
  final movies = await firestore.collection("movies").get();
  if (movies.docs != null) {
    result = movies.docs.map((doc) => Movie().fromJson(doc.data())).toList();
  }
  return result;
}

getUserInfos(String email) async {
  List result = [];
  final userInfos =
      await firestore.collection("users").where((email) => email.email).get();
  if (userInfos.docs != null) {
    result = userInfos.docs.map((doc) => Movie().fromJson(doc.data())).toList();
  }
  return result;
}
