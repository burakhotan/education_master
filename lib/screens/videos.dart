import 'package:flutter/material.dart';
import 'package:education_master/widgets/videoList.dart';

class Videos extends StatefulWidget {
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: VideoList()),
    );
  }
}
