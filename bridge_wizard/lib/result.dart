import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final String resultContract;
  final int resultMade;
  final Function resetHandler;
  final int contractPoint;
  final int overtrickPoint;
  final int slamBonus;
  final int doubleBonus;
  final int underTrickPenalty;

  Result(
      this.resultScore,
      this.resultContract,
      this.resultMade,
      this.resetHandler,
      this.contractPoint,
      this.overtrickPoint,
      this.slamBonus,
      this.doubleBonus,
      this.underTrickPenalty);

  String get resultPhrase {
    var resultHeader = 'For contract: ' + resultContract;
    return resultHeader;
  }

  String get score {
    return resultScore.toString();
  }

  String get made {
    var madeText = 'Made: +' + resultMade.toString();
    return madeText;
  }

  String get total {
    var resultText = '\"Total Score\"';
    return resultText;
  }

  String get contract {
    var contractText = 'Contract Point: +' + contractPoint.toString();
    return contractText;
  }

  String get overtrick {
    var overtrickText = 'Overtrick Point: +' + overtrickPoint.toString();
    return overtrickText;
  }

  String get slam {
    var slamText = 'Slam Bonus: +' + slamBonus.toString();
    return slamText;
  }

  String get doubled {
    var doubledText = 'Doubled Bonus: +' + doubleBonus.toString();
    return doubledText;
  }

  String get underTrick {
    var underTrickText = 'Undertrick Penalty: -' + underTrickPenalty.toString();
    return underTrickText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            made,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            contract,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            overtrick,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            slam,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            doubled,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            underTrick,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            total,
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            score,
            style: TextStyle(
              fontSize: 78,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Resend Score!',
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
