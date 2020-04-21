import 'package:flutter/material.dart';

class MadeEditor extends StatefulWidget {
  @override
  _MadeEditorState createState() => _MadeEditorState();
}

class _MadeEditorState extends State<MadeEditor> {
  int _made = 7;

  void _madeIncrese() {
    setState(() {
      _made += 1;
    });
    
  }

  void _madeDecrese() {
    setState(() {
      _made -= 1;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 90,
            height: 60,
            child: Card(
              child: Center(
                child: Text(
                  'made',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(
              height: 60,
              child: Card(
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Theme.of(context).errorColor,
                    onPressed: _made <= 0 ? null : _madeDecrese,
                  ),
                  title: Text(
                    '$_made',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Theme.of(context).errorColor,
                    onPressed: _made >= 13 ? null : _madeIncrese,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
