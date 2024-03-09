import 'package:aqua_trace/models/servingCategory.dart';

class AddFood{
  final String itemName;
  final double quantity;
  final Category category;

  AddFood({required this.itemName, required this.quantity, required this.category});
}

class AddActivity{
  final String activityName;
  final double time;

  AddActivity({required this.activityName, required this.time});
}