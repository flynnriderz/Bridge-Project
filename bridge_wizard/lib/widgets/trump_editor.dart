import 'package:flutter/material.dart';

class TrumpEditor extends StatefulWidget {
  @override
  _TrumpEditorState createState() => _TrumpEditorState();
}

class _TrumpEditorState extends State<TrumpEditor> {
  List trump = ['Clubs', 'Diamonds', 'Hearts', 'Spades', 'No Trump'];
  int _index = 0;

  void _indexIncrese() {
    setState(() {
      _index += 1;
    });
    
  }

  void _indexDecrese() {
    setState(() {
      _index -= 1;
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
                  'trump',
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
                    onPressed: _index <= 0 ? null : _indexDecrese,
                  ),
                  title: Text(
                    '${trump[_index]}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Theme.of(context).errorColor,
                    onPressed: _index >= 4 ? null : _indexIncrese,
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
