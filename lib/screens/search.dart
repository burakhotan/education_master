import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Map data = {};
  String query = '';

  searchQuery(query, index) {
    if (data['videos'][index]
            .videoName
            .toString()
            .toLowerCase()
            .contains(query) ||
        query == '' ||
        data['videos'][index]
            .category
            .toString()
            .toLowerCase()
            .contains(query)) {
      return data['videos'][index].videoName.toString();
    } else
      return 'No such a video';
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search by video name or category',
          ),
          cursorColor: Colors.black,
          onChanged: (text) {
            text = text.toLowerCase();
            setState(() {
              query = text;
            });
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: data['videos'].length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 5,
                color: Colors.redAccent,
                child: Column(
                  children: [
                    if (searchQuery(query, index) == 'No such a video')
                      Row()
                    else
                      ListTile(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/details',
                              arguments: {
                                'videoName': data['videos'][index].videoName,
                                'videoId': data['videos'][index].videoId,
                              });
                        },
                        leading: Icon(Icons.videocam),
                        title: Text(searchQuery(query, index)),
                        subtitle: Text(data['videos'][index].category),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
