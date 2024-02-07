import 'package:aqua_trace/features/Aqua_Trace/widgets/trackedListCard.dart';
import 'package:flutter/material.dart';

class TrackedList extends StatefulWidget {
  const TrackedList({super.key});

  @override
  State<TrackedList> createState() => _TrackedListState();
}

class _TrackedListState extends State<TrackedList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top:0),
      children: List.generate(10, (index) => const TrackedListCard(),)
        
      ,
    );
  }
}