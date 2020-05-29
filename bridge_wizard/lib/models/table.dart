import 'package:flutter/material.dart';

class Tables {
  final List<String> round;
  final String key;
  final String table_NO;
  int status;

  Tables({
    @required this.round,
    @required this.key,
    @required this.table_NO,
    this.status = 0,
  });
}
