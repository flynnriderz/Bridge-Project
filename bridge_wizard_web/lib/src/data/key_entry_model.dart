import 'package:cloud_firestore/cloud_firestore.dart';

class KeyEntry {
  final String key;
  final DocumentReference table;
  final String documentId;
  KeyEntry({
    this.key,
    this.table,
    this.documentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'key' : key,
      'table' : table,
    };
  }

  static KeyEntry fromDoc(DocumentSnapshot doc) {
    if (doc == null) return null;

    return KeyEntry(
      key: doc.data['key'],
      table: doc.data['table'],
      documentId: doc.documentID,
    );
  }

  @override
  String toString() => 'KeyEntry key:$key ,table: $table'; 

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is KeyEntry &&
        o.key == key &&
        o.table == table;
  }

  @override
  int get hashCode => key.hashCode ^ table.hashCode;
}
