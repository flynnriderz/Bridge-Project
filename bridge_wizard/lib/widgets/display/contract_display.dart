import 'package:flutter/material.dart';
// import '../models/calculating.dart';

class ContractDisplay extends StatefulWidget {
  @override
  _ContractDisplayState createState() => _ContractDisplayState();
}

class _ContractDisplayState extends State<ContractDisplay> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Card(
        child: Container(
          height: 90,
          child: Center(
            child: Text(
              'C',
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
