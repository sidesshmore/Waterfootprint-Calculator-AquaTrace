// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class IncomingList {
  final int id;
  final String uid;
  final String item;
  final double waterfootprint;
  final double quantity;
  final String measure;

  IncomingList({required this.id, required this.uid, required this.item, required this.waterfootprint, required this.quantity, required this.measure});


  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uid': uid,
      'item': item,
      'waterfootprint': waterfootprint,
      'quantity': quantity,
      'measure': measure,
    };
  }

  factory IncomingList.fromMap(Map<String, dynamic> map) {
    return IncomingList(
      id: map['id'] as int,
      uid: map['uid'] as String,
      item: map['item'] as String,
      waterfootprint: map['waterfootprint'] as double,
      quantity: map['quantity'] as double,
      measure: map['measure'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory IncomingList.fromJson(String source) => IncomingList.fromMap(json.decode(source) as Map<String, dynamic>);
}
