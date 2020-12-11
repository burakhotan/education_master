import 'package:education_master/services/video.dart';
import 'package:flutter/material.dart';

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  List<Video> videos = [
    Video(
        videoId: '456081543',
        videoName: 'Video 1',
        thumbnail: 'assets/images/jordan-1.jpg',
        category: 'Human Resources'),
    Video(
        videoId: '456081508',
        videoName: 'Video 2',
        thumbnail: 'assets/images/drose.jpg',
        category: 'Data Mining')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Education Master'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/search',
                  arguments: {'videos': videos});
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            elevation: 5,
            color: Colors.redAccent,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/details', arguments: {
                  'videoName': videos[index].videoName,
                  'videoId': videos[index].videoId,
                });
              },
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        videos[index].thumbnail,
                      )),
                  ListTile(
                    leading: Icon(Icons.videocam),
                    title: Text(videos[index].videoName),
                    subtitle: Text(
                      videos[index].category,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
