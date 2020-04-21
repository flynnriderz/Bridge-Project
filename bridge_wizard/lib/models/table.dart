import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class Tables{
  final int table;
  final int round;
  final int board;
  final String teamNS;
  final String teamEW;
  int teamNSScore;
  int teamEWScore;

  Tables({
    @required this.table,
    @required this.round,
    @required this.board,
    @required this.teamNS,
    @required this.teamEW,
  });

  int get teamNSScores{
    return teamNSScore;
  }

  set teamNSScores(int teamNSScore){
    this.teamNSScore = teamNSScore;
  }

  int get teamEWScores{
    return teamNSScore;
  }

  set teamEWScores(int teamEWScore){
    this.teamEWScore = teamEWScore;
  }
}