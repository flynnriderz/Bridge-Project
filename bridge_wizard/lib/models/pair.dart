import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class Pair{
  final String teamID;
  String player1;
  String player2;

  Pair({
    @required this.teamID,
    this.player1,
    this.player2,
  });
}