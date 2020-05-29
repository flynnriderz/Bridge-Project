import 'package:cloud_firestore/cloud_firestore.dart';

class ScoreEntry {
  final String board;
  final String board_round;
  final String key;
  final String movement;
  final String documentId;
  final String pin;
  final String section_name;
  final String table;
  final String time;
  final String type;
  ScoreEntry({
    this.movement,
    this.board,
    this.board_round,
    this.key,
    this.pin,
    this.section_name,
    this.table,
    this.time,
    this.type,
    this.documentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'movement' : movement,
      'board': board,
      'board_round': board_round,
      'key': key,
      'pin': pin,
      'section_name': section_name,
      'table' : table,
      'time' : time,
      'type' : type,
    };
  }

  static ScoreEntry fromDoc(DocumentSnapshot doc) {
    if (doc == null) return null;

    return ScoreEntry(
      movement: doc.data['movement'],
      board: doc.data['board'],
      board_round: doc.data['board_round'],
      key: doc.data['key'],
      pin: doc.data['pin'],
      section_name: doc.data['section_name'],
      table: doc.data['table'],
      time: doc.data['time'],
      type: doc.data['type'],
      documentId: doc.documentID,
    );
  }

  @override
  String toString() => 'ScoreEntry board: $board, board_round: $board_round, key: $key, movement: $movement, key: $key, movement: $movement, pin: $pin, table: $table, section_name: $section_name, type: $type, time: $time';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ScoreEntry &&
        o.movement == movement &&
        o.board == board &&
        o.board_round == board_round &&
        o.key == key &&
        o.pin == pin &&
        o.section_name == section_name &&
        o.type == type&&
        o.time == time &&
        o.table == table;
  }

  @override
  int get hashCode => board.hashCode ^ board_round.hashCode ^ key.hashCode ^ movement.hashCode ^ pin.hashCode ^ table.hashCode ^ section_name.hashCode ^ time.hashCode ^ type.hashCode;
}
