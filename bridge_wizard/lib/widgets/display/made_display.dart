import 'package:flutter/material.dart';


class MadeDisplay extends StatefulWidget {
  int _made;
  MadeDisplay(this._made);

  @override
  _MadeDisplayState createState() => _MadeDisplayState(_made);
}



class _MadeDisplayState extends State<MadeDisplay> {
  final int finalMade;
  _MadeDisplayState(this.finalMade);

  // void _displayData(){

  // }



  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Card(
        child: Container(
          height: 90,
          child: Center(
            child: Text(
              '$finalMade',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
