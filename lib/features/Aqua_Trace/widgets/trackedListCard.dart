import 'package:aqua_trace/models/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TrackedListCard extends StatelessWidget {
  const TrackedListCard({required this.item,super.key});

  final IncomingList item;

    @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Card(
        elevation: 2,
        shape: const BeveledRectangleBorder(),
        clipBehavior: Clip.hardEdge,
        color: const Color.fromRGBO(249, 249, 249, 1),
        child: SizedBox(
          width: 200,
          height: 50,
          child: Container(
            margin: const EdgeInsets.only(right: 7),
            child:  Row(
              children: [
                const SizedBox(width: 5),
                const Icon(
                  CupertinoIcons.circle_fill,
                  color: Color.fromARGB(255, 24, 94, 247),
                  size: 15,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item.item,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(width: 14),
                Text(item.quantity),
                SizedBox(width: 5,),
                Text(item.measure),
                SizedBox(width: 70),
                Text(item.waterfootprint),
                Spacer(),
                Text('25%')
              ],
            ),
          ),
        ),
      ),
    );
  }
}