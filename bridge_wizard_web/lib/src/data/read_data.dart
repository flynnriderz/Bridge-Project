import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

StreamSubscription <QuerySnapshot> subscription;
String snapshots;

Future readFireStore(String collection,String where) async {
  CollectionReference collectionReference = Firestore.instance.collection(collection).where(where);
   subscription= await collectionReference.snapshots().listen((dataSnapshot) { 
      snapshots = dataSnapshot.documents.toString();
   });
}