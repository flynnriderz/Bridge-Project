import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Rounds{
  final String competitionID;
  final int round;
  final String table;
  final List board;
  final String teamNS;
  final String teamEW;
  // int teamNSScore;
  // int teamEWScore;

  const Rounds({
    @required this.competitionID,
    @required this.round,
    @required this.table,
    @required this.board,
    @required this.teamNS,
    @required this.teamEW,
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