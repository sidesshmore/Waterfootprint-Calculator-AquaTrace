import 'dart:convert';
 
class IncomingList {
  final String waterfootprint;
  final String item;
  final String quantity;
  final String  measure;
 
  IncomingList({required this.waterfootprint, required this.item, required this.quantity, required this.measure});
 
 
 
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'waterfootprint': waterfootprint,
      'item': item,
      'quantity': quantity,
      'measure': measure,
    };
  }
 
  factory IncomingList.fromMap(Map<String, dynamic> map) {
    return IncomingList(
      waterfootprint: map['waterfootprint'] as String,
      item: map['item'] as String,
      quantity: map['quantity'] as String,
      measure: map['measure'] as String,
    );
  }
 
  String toJson() => json.encode(toMap());
 
  factory IncomingList.fromJson(String source) => IncomingList.fromMap(json.decode(source) as Map<String, dynamic>);
}