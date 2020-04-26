import 'package:flutter/material.dart';
import '../../models/calculator.dart';

class MadeEditor extends StatefulWidget {
  final Calculator recentCalculator;
  MadeEditor(this.recentCalculator);

  @override
  _MadeEditorState createState() => _MadeEditorState();
}

class _MadeEditorState extends State<MadeEditor> {
  int _made = 7;

  void _madeIncrese() {
    setState(() {
      _made += 1;
      widget.recentCalculator.madeValues = _made;
    });
    
  }

  void _madeDecrese() {
    setState(() {
      _made -= 1;
      widget.recentCalculator.madeValues = _made;
    });
    
  }

  int get thisMade {
    return _made;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 100,
            height: 60,
            child: Card(
              color: Colors.black54,
              child: Center(
                child: const Text(
                  'made',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  
                ),
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(
              height: 60,
              child: Card(
                color: Colors.black54,
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
                      color: Colors.white,
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
