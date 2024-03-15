import 'package:aqua_trace/features/Aqua_Trace/repos/getItems.dart';
import 'package:aqua_trace/features/Aqua_Trace/widgets/trackedListCard.dart';
import 'package:aqua_trace/models/list.dart';
import 'package:flutter/material.dart';

class TrackedList extends StatefulWidget {
  const TrackedList({required this.inList,super.key});

  final List<IncomingList> inList;
  @override
  State<TrackedList> createState() => _TrackedListState();
}

class _TrackedListState extends State<TrackedList> {

    


  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   padding: const EdgeInsets.only(top:0),
    //   children: List.generate(10, (index) => const TrackedListCard(),)
        
    //   ,
    // );
    List<IncomingList> f_list=widget.inList;
    for(IncomingList i in f_list){
      print(i);
    }

    return ListView.builder(itemCount: widget.inList.length,itemBuilder: (context, index) =>TrackedListCard(item: widget.inList[index]),);
  }
}