import 'package:aqua_trace/features/Aqua_Trace/repos/getItems.dart';
import 'package:aqua_trace/features/Aqua_Trace/widgets/trackedListCard.dart';
import 'package:aqua_trace/models/list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TrackedList extends StatefulWidget {
  const TrackedList({required this.inList, super.key});

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
    

    return widget.inList.length>0 ? 
    ListView.builder(
      itemCount: widget.inList.length,
      itemBuilder: (context, index) => Dismissible(
        // key: ValueKey(widget.inList[index].id),
        key: Key(widget.inList[index].id.toString()),
        // background: Container(
        //   color: Theme.of(context).colorScheme.error.withOpacity(0.75),
        //   margin: EdgeInsets.symmetric(
        //       horizontal: (Theme.of(context).cardTheme.margin!.horizontal)),
        // ),
        onDismissed: (direction) async{
                            final dio = Dio();
                            final response = await dio.delete('https://long-pink-swallow-belt.cyclic.app/delete/${widget.inList[index].id.toString()}',);

                            if (response.statusCode == 200) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'aqua_trace', (route) => false);
                            }
                            print(widget.inList[index].id.toString());
        },
        child: TrackedListCard(item: widget.inList[index]),
      ),
    ):Container(
      child: Center(child: Text('No items here',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),),
    );
  }
}
