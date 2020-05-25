import 'package:flutter/material.dart';

import '../dummy_data/round_dummy_data.dart';
import '../widgets/display/table_display.dart';

class TablesScreen extends StatelessWidget {
  static const routeName = '/tables';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Tables'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_TABLE
            .map(
              (catData) => TableDisplay(
                    catData.id,
                    catData.number,
                  ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 4 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
