import 'package:flutter/material.dart';

import '../../screens/confirm_tables_screen.dart';

class TableDisplay extends StatelessWidget {
  final String id;
  final int number;

  TableDisplay(this.id, this.number);

  void selectTable(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      ConfirmTableScreen.routeName,
      arguments: {
        'id': id,
        'number': number.toString(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTable(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            'Table $number',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pinkAccent.withOpacity(0.7),
              Colors.pinkAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
