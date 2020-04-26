import 'package:cloud_firestore/cloud_firestore.dart';

class TournamentEntry {
  final String director_name;
  final String name;
  final String location;
  final String documentId;
  TournamentEntry({
    this.director_name,
    this.name,
    this.documentId,
    this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'director_name' : director_name,
      'name': name,
      'location' : location,
    };
  }

  static TournamentEntry fromDoc(DocumentSnapshot doc) {
    if (doc == null) return null;

    return TournamentEntry(
      director_name: doc.data['director_name'],
      name: doc.data['name'],
      location : doc.data['location'],
      documentId: doc.documentID,
    );
  }

  @override
  String toString() => 'TournamentEntry name: $name, director_name: $director_name, location: $location'; 

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TournamentEntry &&
        o.director_name == director_name &&
        o.name == name &&
        o.location == location;
  }

  @override
  int get hashCode => name.hashCode ^ director_name.hashCode^ location.hashCode;
}
