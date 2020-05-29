import 'package:cloud_firestore/cloud_firestore.dart';

class RoundEntry {
  final String round_NO;
  final List board_NO;
  final String table_NO;
  final String team_NS;
  final String team_EW;
  final String declaler;
  final String trump;
  final String double_;
  final String vulnerable;
  final String score;
  final String documentId;
  RoundEntry({
    this.round_NO,
    this.table_NO,
    this.team_EW,
    this.board_NO,
    this.team_NS,
    this.declaler,
    this.trump,
    this.double_,
    this.vulnerable,
    this.score,
    this.documentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'round_NO': round_NO,
      'table_NO': table_NO,
      'team_EW' : team_EW,
      'board_NO': board_NO,
      'team_NS': team_NS,
      'declaler': declaler,
      'double_' : double_,
      'trump': trump,
      'score' : score,
      'vulnerable' : vulnerable,
    };
  }

  static RoundEntry fromDoc(DocumentSnapshot doc) {
    if (doc == null) return null;

    return RoundEntry(
      round_NO: doc.data['round_NO'],
      team_EW: doc.data['team_EW'],
      board_NO: doc.data['board_NO'],
      table_NO: doc.data['table_NO'],
      team_NS: doc.data['team_NS'],
      declaler: doc.data['declaler'],
      trump: doc.data['trump'],
      double_: doc.data['double_'],
      vulnerable: doc.data['vulnerable'],
      score: doc.data['score'],
      documentId: doc.documentID,
    );
  }

  @override
  String toString() => 'RoundEntry round_NO:$round_NO, board_NO: $board_NO, table_NO: $table_NO, team_NS: $team_NS, team_EW: $team_EW, declaler: $declaler, double_: $double_, trump: $trump, score: $score, vulnerable: $vulnerable';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RoundEntry &&
        o.round_NO == round_NO &&
        o.team_EW == team_EW &&
        o.board_NO == board_NO &&
        o.table_NO == table_NO &&
        o.team_NS == team_NS &&
        o.declaler == declaler &&
        o.trump == trump &&
        o.score == score&&
        o.vulnerable == vulnerable &&
        o.double_ == double_;
  }

  @override
  int get hashCode => round_NO.hashCode ^board_NO.hashCode ^ table_NO.hashCode ^ team_NS.hashCode ^ team_EW.hashCode ^ declaler.hashCode ^ double_.hashCode ^ trump.hashCode ^ vulnerable.hashCode ^ score.hashCode;
}
