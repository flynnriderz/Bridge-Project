import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Pairs{
  final String pin;
  final String team_NO;
  String team_name;
  String player1;
  String player2;

  Pairs({
    @required this.pin,
    @required this.team_NO,
    this.team_name = '',
    this.player1 = '',
    this.player2 = '',
  });
}