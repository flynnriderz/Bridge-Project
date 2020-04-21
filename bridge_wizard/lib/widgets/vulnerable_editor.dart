import 'package:flutter/material.dart';

class VulnerableEditor extends StatefulWidget {
  @override
  _VulnerableEditorState createState() => _VulnerableEditorState();
}

class _VulnerableEditorState extends State<VulnerableEditor> {
  String _vulnerable = 'Non-Vulnerable';

  void _nonVulnerable() {
    setState(() {
      _vulnerable = 'Non-Vulnerable';
    });
    
  }

  void _isVulnerable() {
    setState(() {
      _vulnerable = 'Vulnerable';
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
                    onPressed: _vulnerable == 'Vulnerable' ? _nonVulnerable : null,
                  ),
                  title: Text(
                    '$_vulnerable',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Theme.of(context).errorColor,
                    onPressed: _vulnerable == 'Non-Vulnerable' ? _isVulnerable : null,
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
