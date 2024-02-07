import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackedListCard extends StatefulWidget {
  const TrackedListCard({super.key});

  @override
  State<TrackedListCard> createState() => _TrackedListCardState();
}

class _TrackedListCardState extends State<TrackedListCard> {
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
            child: const Row(
              children: [
                SizedBox(width: 5),
                Icon(
                  CupertinoIcons.circle_fill,
                  color: const Color.fromARGB(255, 24, 94, 247),
                  size: 15,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Apple',
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Spacer(),
                Text('2 qty'),
                Spacer(),
                Text('5 litres'),
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
