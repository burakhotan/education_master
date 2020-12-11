import 'package:flutter/material.dart';
//Screens
import 'package:education_master/screens/authpage.dart';
import 'package:education_master/screens/videos.dart';
import 'package:education_master/screens/details.dart';
import 'package:education_master/screens/search.dart';
import 'package:education_master/screens/commentsPage.dart';
//Firebase plugin
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'EducationMaster',
    initialRoute: '/authpage',
    routes: {
      '/authpage': (context) => AuthPage(),
      '/details': (context) => Details(),
      '/videos': (context) => Videos(),
      '/search': (context) => Search(),
      '/comments': (context) => CommentsPage(),
    },
  ));
}
