import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Match{
  final int id;
  final int round;
  final int table;
  final List boards;
  final String teamNS;
  final String teamEW;

  Match({
    @required this.id,
    @required this.round,
    @required this.table,
    @required this.boards,
    @required this.teamNS,
    @required this.teamEW,
  });
}