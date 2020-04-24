// import 'dart:math';

import 'package:flutter/cupertino.dart';

class Calculating {
  int _questionIndex; ////////////////////////

  final int contract;
  final String trump;
  final int made;

  int _contractPoint = 0;
  int _overtrickPoint = 0;
  int _slamBonus = 0;
  int _doubleBonus = 0;
  int _underTrickPenalty = 0; ////////////////////////

  String _resultContract = '';
  int _totalScore = 0; ////////////////////////

  bool isDouble = false;
  bool isRedouble = false; ////////////////////////

  bool _isGame = false;
  bool _isSlam = false;
  bool _isGrandSlam = false; ////////////////////////
  bool _isMinor = false;
  bool _isMajor = false; ////////////////////////
  bool _isVulnerable = false; ////////////////////////
  bool _isPenalty = false; ////////////////////////

  //int _level = 0;
  //int _biddingWeight = 0; ////////////////////////

  Calculating({
    @required this.contract,
    @required this.trump,
    @required this.made,
    @required this.isDouble,
    @required this.isRedouble,
  });

  int get questionIndexes {
    return _questionIndex;
  }

  set questionIndexes(int questionIndex) {
    this._questionIndex = questionIndex;
  }

  // int get mades {
  //   return made;
  // }

  // set mades(int made) {
  //   this.made = made;
  // }

  // int get contracts {
  //   return contract;
  // }

  // set contracts(int contract) {
  //   this.contract = contract;
  // }

  // String get trumps {
  //   return trump;
  // }

  // set trumps(String trump) {
  //   this.trump = trump;
  // }

  int get contractPoints {
    return _contractPoint;
  }

  set contractPoints(int contractPoint) {
    this._contractPoint = contractPoint;
  }

  int get overtrickPoints {
    return _overtrickPoint;
  }

  set overtrickPoints(int overtrickPoint) {
    this._overtrickPoint = overtrickPoint;
  }

  int get slamBonuses {
    return _slamBonus;
  }

  set slamBonuses(int slamBonus) {
    this._slamBonus = slamBonus;
  }

  int get doubleBonuses {
    return _doubleBonus;
  }

  set doubleBonuses(int doubleBonus) {
    this._doubleBonus = doubleBonus;
  }

  int get underTrickPenalties {
    return _underTrickPenalty;
  }

  set underTrickPenalties(int underTrickPenalty) {
    this._underTrickPenalty = underTrickPenalty;
  }

  String get resultContracts {
    return _resultContract;
  }

  set resultContracts(String resultContract) {
    this._resultContract = resultContract;
  }

  int get totalScores {
    return _totalScore;
  }

  set totalScores(int totalScore) {
    this._totalScore = totalScore;
  }

  void resetVariable() {
    _totalScore = 0;

    isDouble = false;
    isRedouble = false;

    _isGame = false;
    _isSlam = false;
    _isGrandSlam = false;
    _isMinor = false;
    _isMajor = false;
    _isVulnerable = false;
    _isPenalty = false;

    _contractPoint = 0;
    _overtrickPoint = 0;
    _slamBonus = 0;
    _doubleBonus = 0;
    _underTrickPenalty = 0;
  }

  void settings(int state) {
    // //setting
    // if (_questionIndex == 0) {
    //   // contract = state;
    //   if (contract == 6) {
    //     _isSlam = true;
    //   } else if (contract == 7) {
    //     _isGrandSlam = true;
    //   }
    // } else if (_questionIndex == 1) {
    //   if (state == 1) {
    //     trump = 'C';
    //     _isMinor = true;
    //   } else if (state == 2) {
    //     trump = 'D';
    //     _isMinor = true;
    //   } else if (state == 3) {
    //     trump = 'H';
    //     _isMajor = true;
    //   } else if (state == 4) {
    //     trump = 'S';
    //     _isMajor = true;
    //   } else if (state == 5) {
    //     trump = 'NT';
    //   }
    // } else if (_questionIndex == 2) {
    //   if (state == 1) isDouble = true;
    //   if (state == 2) isRedouble = true;
    // } else if (_questionIndex == 3) {
    //   if (state == 1) _isVulnerable = true;
    // } else if (_questionIndex == 4) {
    //   // contract
    //   _resultContract = contract.toString() + trump;
    //   if (isDouble) _resultContract += 'x';
    //   if (isRedouble) _resultContract += 'x';
    //   if (isVulnerable)
    //     _resultContract += ' (Vul)';
    //   else
    //     _resultContract += ' (Non-Vul)';

    //   //set state on game
    //   made = state;
    //   if (made < (_contract + 6))
    //     _isPenalty = true;
    //   else {
    //     if (isRedouble || isDouble) {
    //       if (_isMinor)
    //         _level = 4;
    //       else
    //         _level = 7;
    //     } else {
    //       if (_isMinor)
    //         _level = 1;
    //       else if (_isMajor)
    //         _level = 5;
    //       else
    //         _level = 9;
    //     }

    //     _biddingWeight = pow(2, contract) - contract + _level;

    //     if (isRedouble) {
    //       if (6 <= _biddingWeight) {
    //         _isGame = true;
    //       }
    //     } else if (isDouble) {
    //       if (9 <= _biddingWeight) {
    //         _isGame = true;
    //       }
    //     } else {
    //       if (14 <= _biddingWeight) {
    //         _isGame = true;
    //       }
    //     }
    //   }
  }

  void scoring() {
    if (_isPenalty) {
      if (!_isVulnerable) {
        if (!isDouble && !isRedouble) {
          _underTrickPenalty = 50 + 50 * (contract + 6 - made - 1);
        } else if (isDouble) {
          _underTrickPenalty = 100 + 200 * (contract + 6 - made - 1);
        } else if (isRedouble) {
          _underTrickPenalty = 200 + 400 * (contract + 6 - made - 1);
        }
      } else {
        if (!isDouble && !isRedouble) {
          _underTrickPenalty = 100 + 100 * (contract + 6 - made - 1);
        } else if (isDouble) {
          _underTrickPenalty = 200 + 300 * (contract + 6 - made - 1);
        } else if (isRedouble) {
          _underTrickPenalty = 400 + 600 * (contract + 6 - made - 1);
        }
      } //Penalty
    } else {
      if (_isGame) {
        if (_isVulnerable) {
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
      if (_isSlam) {
        if (_isVulnerable) {
          _slamBonus = 750;
        } else {
          _slamBonus = 500;
        }
      } else if (_isGrandSlam) {
        if (_isVulnerable) {
          _slamBonus = 1500;
        } else {
          _slamBonus = 1000;
        }
      } //slam Bonus
      if (_isMinor) {
        if (!isDouble && !isRedouble) {
          _contractPoint += 20 * (contract);
        } else if (isDouble) {
          _contractPoint += 40 * (contract);
        } else if (isRedouble) {
          _contractPoint += 80 * (contract);
        }
      } else if (_isMajor) {
        if (!isDouble && !isRedouble) {
          _contractPoint += 30 * (contract);
        } else if (isDouble) {
          _contractPoint += 60 * (contract);
        } else if (isRedouble) {
          _contractPoint += 120 * (contract);
        }
      } else if (!_isMinor && !_isMajor) {
        if (!isDouble && !isRedouble) {
          _contractPoint += 40 + 30 * (contract - 1);
        } else if (isDouble) {
          _contractPoint += 80 + 60 * (contract - 1);
        } else if (isRedouble) {
          _contractPoint += 160 + 120 * (contract - 1);
        }
      } //contract bonus
      if (!_isVulnerable) {
        if (!isDouble && !isRedouble) {
          if (_isMinor) {
            _overtrickPoint = 20 * (made - contract - 6);
          } else {
            _overtrickPoint = 30 * (made - contract - 6);
          }
        } else if (isDouble) {
          _overtrickPoint = 100 * (made - contract - 6);
        } else if (isRedouble) {
          _overtrickPoint = 200 * (made - contract - 6);
        }
      } else {
        if (!isDouble && !isRedouble) {
          if (_isMinor) {
            _overtrickPoint = 20 * (made - contract - 6);
          } else {
            _overtrickPoint = 30 * (made - contract - 6);
          }
        } else if (isDouble) {
          _overtrickPoint = 200 * (made - contract - 6);
        } else if (isRedouble) {
          _overtrickPoint = 400 * (made - contract - 6);
        }
      } //over Trick Point
    }

    _totalScore = _contractPoint +
        _slamBonus +
        _doubleBonus +
        _overtrickPoint -
        _underTrickPenalty;
  }
}
