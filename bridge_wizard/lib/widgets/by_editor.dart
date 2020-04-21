import 'package:flutter/material.dart';

class ByEditor extends StatefulWidget {
  @override
  _ByEditorState createState() => _ByEditorState();
}

class _ByEditorState extends State<ByEditor> {
  String _by = 'N - S';

  void _byNS() {
    setState(() {
      _by = 'N - S';
    });
    
  }

  void _byEW() {
    setState(() {
      _by = 'E - W';
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
                  'by',
                  style: TextStyle(
                    fontSize: 18,
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
                    onPressed: _by == 'E - W' ? _byNS : null,
                  ),
                  title: Text(
                    '$_by',
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
                    onPressed: _by == 'N - S' ? _byEW : null,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      //),
    );
  }
}
