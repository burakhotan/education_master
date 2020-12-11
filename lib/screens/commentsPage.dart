import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  List<String> _comments = [];

  void _addComment(String val) {
    setState(() {
      _comments.add(val);
      Navigator.pushReplacementNamed(context, '/details',
          arguments: {'comments': _comments});
    });
  }

  Widget _buildCommentList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index < _comments.length) {
        return _buildCommentItem(_comments[index]);
      }
    });
  }

  Widget _buildCommentItem(String comment) {
    return ListTile(
      title: Text(comment),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildCommentList(),
          ),
          TextField(
            onSubmitted: (String submittedStr) {
              _addComment(submittedStr);
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20), hintText: 'Add comment'),
          )
        ],
      ),
    );
  }
}
