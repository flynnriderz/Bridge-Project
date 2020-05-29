import 'package:flutter/material.dart';
import '../../methods/calculator.dart';

class DoubleEditor extends StatefulWidget {
  final Calculator recentCalculator;
  DoubleEditor(this.recentCalculator);

  @override
  _DoubleEditorState createState() => _DoubleEditorState();
}

class _DoubleEditorState extends State<DoubleEditor> {
  List _doubled = ['Undouble', 'Double', 'Redouble'];
  int _index = 0;

  void _indexIncrese() {
    setState(() {
      _index += 1;
      widget.recentCalculator.doubleIndexes = _index;
    });
    
  }

  void _indexDecrese() {
    setState(() {
      _index -= 1;
      widget.recentCalculator.doubleIndexes = _index;
    });
    
  }

  int get thisIndex {
    return _index;
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
              child: Center(
                child: const Text(
                  'Doubled',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
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
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Theme.of(context).errorColor,
                    onPressed: _index <= 0 ? null : _indexDecrese,
                  ),
                  title: Text(
                    '${_doubled[_index]}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Theme.of(context).errorColor,
                    onPressed: _index >= 2 ? null : _indexIncrese,
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
