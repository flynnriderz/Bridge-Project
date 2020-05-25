import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class Pairs{
  final String pairID;
  final String player1;
  final String player2;

  const Pairs({
    @required this.pairID,
    this.player1 = '-',
    this.player2 = '-',
  });
}