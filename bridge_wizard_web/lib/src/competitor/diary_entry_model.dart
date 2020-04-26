import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryEntry {
  final String player1_name;
  final String player2_name;
  final String team_name;
  final String team_NO;
  final String pin;
  final String documentId;
  DiaryEntry({
    this.team_NO,
    this.player1_name,
    this.player2_name,
    this.pin,
    this.team_name,
    this.documentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'team_NO' : team_NO,
      'pin' : pin,
      'player1_name': player1_name,
      'player2_name': player2_name,
      'team_name': team_name,
    };
  }

  static DiaryEntry fromDoc(DocumentSnapshot doc) {
    if (doc == null) return null;

    return DiaryEntry(
      team_NO: doc.data['team_NO'],
      pin: doc.data['pin'],
      player1_name: doc.data['player1_name'],
      player2_name: doc.data['player2_name'],
      team_name: doc.data['team_name'],
      documentId: doc.documentID,
    );
  }

  @override
  String toString() => 'DiaryEntry player1_name: $player1_name, player2_name: $player2_name, team_name: $team_name, team_NO: $team_NO, pin: $pin';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DiaryEntry &&
    
        o.player1_name == player1_name &&
        o.player2_name == player2_name &&
        o.team_name == team_name &&
        o.team_NO == team_NO &&
        o.pin == pin;
        
  }

  @override
  int get hashCode => player1_name.hashCode ^ player2_name.hashCode ^ team_name.hashCode ^ team_NO.hashCode ^ pin.hashCode;
}
