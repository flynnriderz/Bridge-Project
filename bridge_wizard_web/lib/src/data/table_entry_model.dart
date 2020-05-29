import 'package:cloud_firestore/cloud_firestore.dart';

class TableEntry {
  final String key;
  final String table_NO;
  final int status;
  final String documentId;

  TableEntry({
    this.key,
    this.status,
    this.table_NO,
    this.documentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'key' : key,
      'status' : status,
      'table_NO' : table_NO,
    };
  }

  static TableEntry fromDoc(DocumentSnapshot doc) {
    if (doc == null) return null;

    return TableEntry(
      key: doc.data['key'],
      status: doc.data['status'],
      table_NO: doc.data['table_NO'],
      documentId: doc.documentID,
    );
  }

  @override
  String toString() => 'TableEntry key:$key ,status:$status ,table_NO: $table_NO'; 

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TableEntry &&
        o.key == key &&
        o.table_NO == table_NO &&
        o.status == status;
  }

  @override
  int get hashCode => key.hashCode ^status.hashCode ^ table_NO.hashCode;
}
