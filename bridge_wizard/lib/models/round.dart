import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Rounds{
  final String roundID;
  final int round_NO;
  final String table_NO;
  final List board_NO;
  final String team_NS;
  final String team_EW;
  // int declarer;
  // int score;

  Rounds({
    @required this.roundID,
    @required this.round_NO,
    @required this.table_NO,
    @required this.board_NO,
    @required this.team_NS,
    @required this.team_EW,
  });

  // int get teamNSScores{
  //   return teamNSScore;
  // }

  // set teamNSScores(int teamNSScore){
  //   this.teamNSScore = teamNSScore;
  // }

  // int get teamEWScores{
  //   return teamNSScore;
  // }

  // set teamEWScores(int teamEWScore){
  //   this.teamEWScore = teamEWScore;
  // }
}