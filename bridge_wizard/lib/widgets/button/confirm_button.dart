import 'package:flutter/material.dart';
// import '../models/calculating.dart';

class ConfirmButton extends StatefulWidget {
  @override
  _ConfirmButtonState createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        RaisedButton(
          child: Text('Confirm'),
          color: Colors.blue,
          textColor: Theme.of(context).textTheme.button.color,
          onPressed: () {},
        ),
      ],
    );
  }
}
