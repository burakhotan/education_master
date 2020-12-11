import 'package:flutter/material.dart';
import 'package:vimeoplayer/vimeoplayer.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Map data = {};
  bool isLiked = false;
  bool isDisliked = false;
  int likes = 0;
  int dislikes = 0;
  bool clicked = false;
  _commentButtonPressed() {
    setState(() {
      Navigator.pushNamed(context, '/comments');
    });
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(data['videoName']),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.popAndPushNamed(context, '/videos'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          VimeoPlayer(
            id: data['videoId'],
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {
                  setState(() {
                    if (!clicked) {
                      clicked = true;
                      isLiked = true;
                      likes++;
                    } else {
                      if (isDisliked) {
                        isDisliked = false;
                        isLiked = true;
                        dislikes--;
                        likes++;
                      } else {
                        if (!isLiked) {
                          isLiked = true;
                          likes++;
                        } else {
                          likes = likes;
                        }
                      }
                    }
                  });
                },
                color: (isLiked) ? Colors.redAccent : Colors.black26,
              ),
              Text('$likes'),
              IconButton(
                  icon: Icon(Icons.thumb_down),
                  onPressed: () {
                    setState(() {
                      if (!clicked) {
                        clicked = true;
                        isDisliked = true;
                        dislikes++;
                      } else {
                        if (isLiked) {
                          isLiked = false;
                          isDisliked = true;
                          likes--;
                          dislikes++;
                        } else {
                          if (!isDisliked) {
                            isDisliked = true;
                            dislikes++;
                          } else {
                            dislikes = dislikes;
                          }
                        }
                      }
                    });
                  },
                  color: (isDisliked) ? Colors.redAccent : Colors.black26),
              Text('$dislikes'),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {
                  _commentButtonPressed();
                },
              )
            ],
          ),
          Text('Comments'),
          Text(data['comments'].toString())
        ],
      ),
    );
  }
}
