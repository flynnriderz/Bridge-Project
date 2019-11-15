import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  //_MyAppState createState() => _MyAppState();
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'ระดับของสัญญาการประมูล',
      'answer': [
        {'text': 'ระดับ 1', 'state': 1},
        {'text': 'ระดับ 2', 'state': 2},
        {'text': 'ระดับ 3', 'state': 3},
        {'text': 'ระดับ 4', 'state': 4},
        {'text': 'ระดับ 5', 'state': 5},
        {'text': 'ระดับ 6', 'state': 6},
        {'text': 'ระดับ 7', 'state': 7},
      ],
    },
    {
      'questionText': 'หน้าของทรัมพ์ในการประมูล',
      'answer': [
        {'text': 'ดอกจิก(C)', 'state': 1},
        {'text': 'ข้าวหลามตัด(D)', 'state': 2},
        {'text': 'โพแดง(H)', 'state': 3},
        {'text': 'โพดำ(S)', 'state': 4},
        {'text': 'โนทรัมพ์(NT)', 'state': 5},
      ],
    },
    {
      'questionText': 'การถูกดับเบิ้ลและรีดับเบิ้ล',
      'answer': [
        {'text': 'ปกติ(-)', 'state': 0},
        {'text': 'ถูกดับเบิล(X)', 'state': 1},
        {'text': 'รีดับเบิล(XX)', 'state': 2},
      ],
    },
    {
      'questionText': 'รูปแบบเกมของกระดาน',
      'answer': [
        {'text': 'ปกติ(Non-Vulnerable)', 'state': 0},
        {'text': 'มีเกม(Vulnerable)', 'state': 1},
      ],
    },
    {
      'questionText': 'จำนวนตองที่กินได้',
      'answer': [
        {'text': '1', 'state': 1},
        {'text': '2', 'state': 2},
        {'text': '3', 'state': 3},
        {'text': '4', 'state': 4},
        {'text': '5', 'state': 5},
        {'text': '6', 'state': 6},
        {'text': '7', 'state': 7},
        {'text': '8', 'state': 8},
        {'text': '9', 'state': 9},
        {'text': '10', 'state': 10},
        {'text': '11', 'state': 11},
        {'text': '12', 'state': 12},
        {'text': '13', 'state': 13},
      ],
    },
  ];

  var _questionIndex = 0;

  bool isGame = false;
  bool isSlam = false;
  bool isGrandSlam = false;
  bool isMinor = false;
  bool isMajor = false;
  bool isDouble = false;
  bool isRedouble = false;
  bool isVulnerable = false;
  bool isPenalty = false;

  var _contract = 0;
  var _made = 0;
  var _trump = '';

  var _contractPoint = 0;
  var _overtrickPoint = 0;
  var _slamBonus = 0;
  var _doubleBonus = 0;
  var _underTrickPenalty = 0;

  var _resultContract = '';
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;

      isGame = false;
      isSlam = false;
      isGrandSlam = false;
      isMinor = false;
      isMajor = false;
      isDouble = false;
      isRedouble = false;
      isVulnerable = false;
      isPenalty = false;

      _contractPoint = 0;
      _overtrickPoint = 0;
      _slamBonus = 0;
      _doubleBonus = 0;
      _underTrickPenalty = 0;
    });
  }

  void calculation(int state) {
    if (_questionIndex == 0) {
      _contract = state;
      if (_contract == 6)
        isSlam = true;
      else if (_contract == 7) isGrandSlam = true;
    } else if (_questionIndex == 1) {
      if (state == 1) {
        _trump = 'C';
        isMinor = true;
      } else if (state == 2) {
        _trump = 'D';
        isMinor = true;
      } else if (state == 3) {
        _trump = 'H';
        isMajor = true;
      } else if (state == 4) {
        _trump = 'S';
        isMajor = true;
      } else if (state == 5) {
        _trump = 'NT';
      }
    } else if (_questionIndex == 2) {
      if (state == 1) isDouble = true;
      if (state == 2) isRedouble = true;
    } else if (_questionIndex == 3) {
      if (state == 1) isVulnerable = true;
    } else if (_questionIndex == 4) {
      // contract
      _resultContract = _contract.toString() + _trump;
      if (isDouble) _resultContract += 'x';
      if (isRedouble) _resultContract += 'x';
      if (isVulnerable)
        _resultContract += ' (Vul)';
      else
        _resultContract += ' (Non-Vul)';

      //set state
      _made = state;
      if (_made < _contract + 6) isPenalty = true;
      if ((!isDouble && !isRedouble && isMinor && (_contract >= 5)) ||
          (!isDouble && !isRedouble && isMajor && (_contract >= 4)) ||
          (!isDouble &&
              !isRedouble &&
              !isMinor &&
              !isMajor &&
              (_contract >= 3)) ||
          (isDouble && isMinor && (_contract >= 4)) ||
          (isDouble && isMajor && (_contract >= 2)) ||
          (isDouble && !isMinor && !isMajor && (_contract >= 1)) ||
          (isRedouble && isMinor && (_contract >= 3)) ||
          (isRedouble && isMajor && (_contract >= 2)) ||
          (isRedouble && !isMinor && !isMajor && (_contract >= 1)))
        isGame = true;

      //scoring
      if (isPenalty) {
        if (!isVulnerable) {
          if (!isDouble && !isRedouble) {
            _underTrickPenalty = 50 + 50 * (_contract + 6 - _made - 1);
          } else if (isDouble) {
            _underTrickPenalty = 100 + 200 * (_contract + 6 - _made - 1);
          } else if (isRedouble) {
            _underTrickPenalty = 200 + 400 * (_contract + 6 - _made - 1);
          }
        } else {
          if (!isDouble && !isRedouble) {
            _underTrickPenalty = 100 + 100 * (_contract + 6 - _made - 1);
          } else if (isDouble) {
            _underTrickPenalty = 200 + 300 * (_contract + 6 - _made - 1);
          } else if (isRedouble) {
            _underTrickPenalty = 400 + 600 * (_contract + 6 - _made - 1);
          }
        } //Penalty
      } else {
        if (isGame) {
          if (isVulnerable) {
            _contractPoint = 500;
          } else {
            _contractPoint = 300;
          }
        } else {
          _contractPoint = 50;
        } //contract point
        if (isDouble) {
          _doubleBonus = 50;
        } else if (isRedouble) {
          _doubleBonus = 100;
        } //double Bonus
        if (isSlam) {
          if (isVulnerable) {
            _slamBonus = 750;
          } else {
            _slamBonus = 500;
          }
        } else if (isGrandSlam) {
          if (isVulnerable) {
            _slamBonus = 1500;
          } else {
            _slamBonus = 1000;
          }
        } //slam Bonus
        if (isMinor) {
          if (!isDouble && !isRedouble) {
            _contractPoint += 20 * (_contract);
          } else if (isDouble) {
            _contractPoint += 40 * (_contract);
          } else if (isRedouble) {
            _contractPoint += 60 * (_contract);
          }
        } else if (isMajor) {
          if (!isDouble && !isRedouble) {
            _contractPoint += 30 * (_contract);
          } else if (isDouble) {
            _contractPoint += 60 * (_contract);
          } else if (isRedouble) {
            _contractPoint += 120 * (_contract);
          }
        } else if (!isMinor && !isMajor) {
          if (!isDouble && !isRedouble) {
            _contractPoint += 40 + 30 * (_contract - 1);
          } else if (isDouble) {
            _contractPoint += 80 + 60 * (_contract - 1);
          } else if (isRedouble) {
            _contractPoint += 160 + 120 * (_contract - 1);
          }
        } //contract point over
        if (!isVulnerable) {
          if (!isDouble && !isRedouble) {
            if (isMinor) {
              _overtrickPoint = 20 * (_made - _contract - 6);
            } else {
              _overtrickPoint = 30 * (_made - _contract - 6);
            }
          } else if (isDouble) {
            _overtrickPoint = 100 * (_made - _contract - 6);
          } else if (isRedouble) {
            _overtrickPoint = 200 * (_made - _contract - 6);
          }
        } else {
          if (!isDouble && !isRedouble) {
            if (isMinor) {
              _overtrickPoint = 20 * (_made - _contract - 6);
            } else {
              _overtrickPoint = 30 * (_made - _contract - 6);
            }
          } else if (isDouble) {
            _overtrickPoint = 300 * (_made - _contract - 6);
          } else if (isRedouble) {
            _overtrickPoint = 600 * (_made - _contract - 6);
          }
        } //over Trick Point
      }

      _totalScore = _contractPoint +
          _slamBonus +
          _doubleBonus +
          _overtrickPoint +
          -_underTrickPenalty;
    }
  }

  void _answerQuestion(int state) {
    calculation(state);

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bridge Wizard Beta: Scoring'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                _totalScore,
                _resultContract,
                _made,
                _resetQuiz,
                _contractPoint,
                _overtrickPoint,
                _slamBonus,
                _doubleBonus,
                _underTrickPenalty,
              ),
      ),
    );
  }
}
