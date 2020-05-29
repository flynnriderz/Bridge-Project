import 'package:flutter/material.dart';
import '../../methods/calculator.dart';

class ResultDisplay extends StatelessWidget {
  final Calculator recentCalculator;

  ResultDisplay(this.recentCalculator);

  @override
  Widget build(BuildContext context) {
    final double font = 20;
    final double firstWidth = 130;
    final double secondWidth = 70;
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          Card(
            elevation: 4,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: firstWidth,
                      child: Text(
                        'Declarer:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: font,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      width: secondWidth,
                      child: Text(
                        '${recentCalculator.declarerStrings}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: font,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: firstWidth,
                      child: Text(
                        'Contract:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: font,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      width: secondWidth,
                      child: Text(
                        '${recentCalculator.resultContracts}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: font,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: firstWidth,
                      child: Text(
                        'Vulnerable:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: font,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      width: secondWidth,
                      child: Text(
                        '${recentCalculator.vulnerableStrings}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: font,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: firstWidth,
                      child: Text(
                        'Made:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: font,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      width: secondWidth,
                      child: Text(
                        '${recentCalculator.madeStrings}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: font,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.height * 0.1,
          ),
          Card(
            elevation: 4,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    children: [
                      Text(
                        'Total Score',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: font,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'for ' +
                            (recentCalculator.totalScores < 0
                                ? recentCalculator.nonDeclarerSide
                                : recentCalculator.declarerSide),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: font - 4,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    '${recentCalculator.totalScores.abs()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
