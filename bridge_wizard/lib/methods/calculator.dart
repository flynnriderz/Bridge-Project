class Calculator {
  int declarerIndex;
  int contractValue;
  int trumpIndex;
  int doubleIndex;
  int madeValue;

  int _vulnerableIndex = 0;
  int _rollboard = 0;

  int _contractPoint = 0;
  int _overtrickPoint = 0;
  int _slamBonus = 0;
  int _doubleBonus = 0;
  int _underTrickPenalty = 0;

  String _resultContract = '';
  String _madeString = '';
  String _doubleString = '';
  String _trumpString = '';
  String _vulnerableString = '';
  String _declarerString = '';
  String _declarerSideString = '';
  String _nonDeclarerSideString = '';
  int _totalScore = 0;

  bool _isDouble = false;
  bool _isRedouble = false;

  bool _isGame = false;
  bool _isSlam = false;
  bool _isGrandSlam = false;
  bool _isMinor = false;
  bool _isMajor = false;
  bool _isVulnerable = false;
  bool _isPenalty = false;

  int _level = 0;
  int _biddingWeight = 0;

  List declarer = ['N', 'E', 'S', 'W'];
  List doubled = ['', 'x', 'xx'];
  List trump = ['C', 'D', 'H', 'S', 'NT'];
  List vulnerable = [
    ['No', 'No'],
    ['Yes', 'No'],
    ['No', 'Yes'],
    ['Yes', 'Yes']
  ];

  Calculator({
    this.declarerIndex,
    this.contractValue,
    this.trumpIndex,
    this.doubleIndex,
    this.madeValue,
  });

  // --------------------unnessesary begin--------------------
  // int get contractPoints {
  //   return _contractPoint;
  // }

  // set contractPoints(int contractPoint) {
  //   this._contractPoint = contractPoint;
  // }

  // int get overtrickPoints {
  //   return _overtrickPoint;
  // }

  // set overtrickPoints(int overtrickPoint) {
  //   this._overtrickPoint = overtrickPoint;
  // }

  // int get slamBonuses {
  //   return _slamBonus;
  // }

  // set slamBonuses(int slamBonus) {
  //   this._slamBonus = slamBonus;
  // }

  // int get doubleBonuses {
  //   return _doubleBonus;
  // }

  // set doubleBonuses(int doubleBonus) {
  //   this._doubleBonus = doubleBonus;
  // }

  // int get underTrickPenalties {
  //   return _underTrickPenalty;
  // }

  // set underTrickPenalties(int underTrickPenalty) {
  //   this._underTrickPenalty = underTrickPenalty;
  // }

  // String get resultContracts {
  //   return _resultContract;
  // }

  // set resultContracts(String resultContract) {
  //   this._resultContract = resultContract;
  // }
  //--------------------unnessesary end--------------------

  // _totalScore;
  int get totalScores {
    return _totalScore;
  }

  // declarerIndex;
  int get declarerIndexes {
    return declarerIndex;
  }

  set declarerIndexes(int declarerIndex) {
    this.declarerIndex = declarerIndex;
  }

  // contractValue;
  int get contractValues {
    return contractValue;
  }

  set contractValues(int contractValue) {
    this.contractValue = contractValue;
  }

  // trumpIndex;
  int get trumpIndexes {
    return trumpIndex;
  }

  set trumpIndexes(int trumpIndex) {
    this.trumpIndex = trumpIndex;
  }

  // doubleIndex;
  int get doubleIndexes {
    return doubleIndex;
  }

  set doubleIndexes(int doubleIndex) {
    this.doubleIndex = doubleIndex;
  }

  // madeValue;
  int get madeValues {
    return madeValue;
  }

  set madeValues(int madeValue) {
    this.madeValue = madeValue;
  }

  // _resultContract;
  String get resultContracts {
    return _resultContract;
  }

  set resultContracts(String _resultContract) {
    this._resultContract = _resultContract;
  }

  // _madeString;
  String get madeStrings {
    return _madeString;
  }

  // _doubleString;
  String get doubleStrings {
    return _doubleString;
  }

  // _trumpString;
  String get trumpStrings {
    return _trumpString;
  }
  

  // _vulnerableString;
  String get vulnerableStrings {
    return _vulnerableString;
  }

  // _declarerString;
  String get declarerStrings {
    return _declarerString;
  }

  // _nonDeclarer;
  String get declarerSide {
    return _declarerSideString;
  }

  // _nonDeclarer;
  String get nonDeclarerSide {
    return _nonDeclarerSideString;
  }

  //rolling number
  int adjustRotate(int rotate) {
    if (rotate > 16)
      return adjustRotate(rotate - 16);
    else
      return rotate;
  }

  void resetVariable() {
    _vulnerableIndex = 0;
    _rollboard = 0;

    _totalScore = 0;
    _resultContract = '';
    _madeString = '';
    _doubleString = '';
    _trumpString = '';
    _vulnerableString = '';
    _declarerString = '';
    _declarerSideString = '';
    _nonDeclarerSideString = '';

    _isDouble = false;
    _isRedouble = false;

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

  void setDeclarer() {
    _declarerString = '${declarer[declarerIndex]}';
    _declarerSideString = declarerIndex % 2 == 0 ? 'North - South' : 'East - West';
    _nonDeclarerSideString = declarerIndex % 2 == 0 ? 'East - West' : 'North - South';
  }

  void setContract() {
    if (contractValue == 6) {
      _isSlam = true;
      _isGrandSlam = false;
    } else if (contractValue == 7) {
      _isSlam = false;
      _isGrandSlam = true;
    } else {
      _isSlam = false;
      _isGrandSlam = false;
    }
  }

  void setTrump() {
    _trumpString = trump[trumpIndexes];
    if (trumpIndex == 0 || trumpIndex == 1) {
      _isMinor = true;
      _isMajor = false;
    } else if (trumpIndex == 2 || trumpIndex == 3) {
      _isMinor = false;
      _isMajor = true;
    } else {
      _isMinor = false;
      _isMajor = false;
    }
  }

  void setDouble() {
    if (doubleIndex == 0) {
      _isDouble = false;
      _isRedouble = false;
      _doubleString = 'Non-Double';
    } else if (doubleIndex == 1) {
      _isDouble = true;
      _isRedouble = false;
      _doubleString = 'Doubled';
    } else if (doubleIndex == 2) {
      _isDouble = false;
      _isRedouble = true;
      _doubleString = 'Redoubled';
    }
  }

  void setVul(int currentBoard) {
    _vulnerableIndex = declarerIndex % 2 == 0 ? 0 : 1;
    _isVulnerable = _vulnerableIndex == 0 ? false : true;
    _rollboard = adjustRotate(((adjustRotate(currentBoard) - 1) ~/ 4) +
        ((adjustRotate(currentBoard) - 1) % 4));
    _vulnerableString = '${vulnerable[_rollboard][_vulnerableIndex]}';
  }

  void setResultContract() {
    _resultContract =
        '$contractValue' + '${trump[trumpIndex]}' + '${doubled[doubleIndex]}';
  }

  void setMade() {
    if (madeValue == (contractValue + 6))
      _madeString = '=';
    else {
      _madeString = madeValue < (contractValue + 6)
          ? '${madeValue - (contractValue + 6)}'
          : '+' + '${madeValue - (contractValue + 6)}';
    }
  }

  void setGame() {
    if (madeValue < (contractValue + 6)) {
      _isPenalty = true;
      _isGame = false;
    } else {
      _isPenalty = false;
      if (!_isMajor && !_isMinor) {
        _level = 7;
      } else if (_isMajor) {
        _level = 6;
      } else if (_isMajor) {
        _level = 4;
      }

      _biddingWeight = 2 * contractValue + _level;

      if (_isRedouble) {
        if (6 < _biddingWeight) {
          _isGame = true;
        } else {
          _isGame = false;
        }
      } else if (_isDouble) {
        if (9 < _biddingWeight) {
          _isGame = true;
        } else {
          _isGame = false;
        }
      } else if (!_isRedouble && !_isDouble) {
        if (12 < _biddingWeight) {
          _isGame = true;
        } else {
          _isGame = false;
        }
      }
    }
  }

  void combineSettings(int board) {
    setDeclarer();
    setContract();
    setDouble();
    setTrump();
    setVul(board);
    setResultContract();
    setMade();
    setGame();
  }

  void calculating() {
    if (_isPenalty) {
      if (!_isVulnerable) {
        if (!_isDouble && !_isRedouble) {
          _underTrickPenalty = 50 + 50 * (contractValue + 6 - madeValue - 1);
        } else if (_isDouble) {
          _underTrickPenalty = 100 + 200 * (contractValue + 6 - madeValue - 1);
        } else if (_isRedouble) {
          _underTrickPenalty = 200 + 400 * (contractValue + 6 - madeValue - 1);
        }
      } else {
        if (!_isDouble && !_isRedouble) {
          _underTrickPenalty = 100 + 100 * (contractValue + 6 - madeValue - 1);
        } else if (_isDouble) {
          _underTrickPenalty = 200 + 300 * (contractValue + 6 - madeValue - 1);
        } else if (_isRedouble) {
          _underTrickPenalty = 400 + 600 * (contractValue + 6 - madeValue - 1);
        }
      } 
      //Penalty
    } else {
      if (_isGame) {
        if (_isVulnerable) {
          _contractPoint = 500;
        } else {
          _contractPoint = 300;
        }
      } else {
        _contractPoint = 50;
      } 
      //contract point
      if (_isDouble) {
        _doubleBonus = 50;
      } else if (_isRedouble) {
        _doubleBonus = 100;
      } 
      //double Bonus
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
      }
      //slam Bonus
      if (_isMinor) {
        if (!_isDouble && !_isRedouble) {
          _contractPoint += 20 * (contractValue);
        } else if (_isDouble) {
          _contractPoint += 40 * (contractValue);
        } else if (_isRedouble) {
          _contractPoint += 80 * (contractValue);
        }
      } else if (_isMajor) {
        if (!_isDouble && !_isRedouble) {
          _contractPoint += 30 * (contractValue);
        } else if (_isDouble) {
          _contractPoint += 60 * (contractValue);
        } else if (_isRedouble) {
          _contractPoint += 120 * (contractValue);
        }
      } else if (!_isMinor && !_isMajor) {
        if (!_isDouble && !_isRedouble) {
          _contractPoint += 40 + 30 * (contractValue - 1);
        } else if (_isDouble) {
          _contractPoint += 80 + 60 * (contractValue - 1);
        } else if (_isRedouble) {
          _contractPoint += 160 + 120 * (contractValue - 1);
        }
      } 
      //contract bonus
      if (!_isVulnerable) {
        if (!_isDouble && !_isRedouble) {
          if (_isMinor) {
            _overtrickPoint = 20 * (madeValue - contractValue - 6);
          } else {
            _overtrickPoint = 30 * (madeValue - contractValue - 6);
          }
        } else if (_isDouble) {
          _overtrickPoint = 100 * (madeValue - contractValue - 6);
        } else if (_isRedouble) {
          _overtrickPoint = 200 * (madeValue - contractValue - 6);
        }
      } else {
        if (!_isDouble && !_isRedouble) {
          if (_isMinor) {
            _overtrickPoint = 20 * (madeValue - contractValue - 6);
          } else {
            _overtrickPoint = 30 * (madeValue - contractValue - 6);
          }
        } else if (_isDouble) {
          _overtrickPoint = 200 * (madeValue - contractValue - 6);
        } else if (_isRedouble) {
          _overtrickPoint = 400 * (madeValue - contractValue - 6);
        }
      } 
      //over Trick Point
    }
  }

  void scoring(int board) {
    resetVariable();
    combineSettings(board);
    calculating();

    _totalScore = _contractPoint +
        _slamBonus +
        _doubleBonus +
        _overtrickPoint -
        _underTrickPenalty;

    // print('');
    // print('declarer: $declarerStrings');
    // print('contract: $resultContracts');
    // print('vulnerable: $vulnerableStrings');
    // print('made: $madeStrings');
    // print('total score: $totalScores');
  }
}
