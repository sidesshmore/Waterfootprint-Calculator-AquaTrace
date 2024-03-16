// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class AllFood {
  final String fooditems;

  AllFood({required this.fooditems});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fooditems': fooditems,
    };
  }

  factory AllFood.fromMap(Map<String, dynamic> map) {
    return AllFood(
      fooditems: map['fooditems'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllFood.fromJson(String source) => AllFood.fromMap(json.decode(source) as Map<String, dynamic>);
}


class AllActivity {
  final String activity;

  AllActivity({required this.activity});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'activity': activity,
    };
  }

  factory AllActivity.fromMap(Map<String, dynamic> map) {
    return AllActivity(
      activity: map['activity'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllActivity.fromJson(String source) => AllActivity.fromMap(json.decode(source) as Map<String, dynamic>);
}
