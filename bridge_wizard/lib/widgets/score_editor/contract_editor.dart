import 'package:flutter/material.dart';
import '../../methods/calculator.dart';

class ContractEditor extends StatefulWidget {
  final Calculator recentCalculator;
  ContractEditor(this.recentCalculator);

  @override
  _ContractEditorState createState() => _ContractEditorState();
}

class _ContractEditorState extends State<ContractEditor> {
  int _contractPoint = 1;


  void contractIncrese() {
    setState(() {
      _contractPoint += 1;
      widget.recentCalculator.contractValues = _contractPoint;
    });
  }

  void contractDecrese() {
    setState(() {
      _contractPoint -= 1;
      widget.recentCalculator.contractValues = _contractPoint;
    });
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
                  'Contract',
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
                child: Center(
                  child: ListTile(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Theme.of(context).errorColor,
                      onPressed: _contractPoint <= 1 ? null : contractDecrese,
                    ),
                    title: Text(
                      '$_contractPoint',
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
                      onPressed: _contractPoint >= 7 ? null : contractIncrese,
                    ),
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
