import 'package:aqua_trace/features/Aqua_Trace/repos/getItems.dart';
import 'package:aqua_trace/features/Aqua_Trace/widgets/chart.dart';
import 'package:aqua_trace/features/Aqua_Trace/widgets/topBar.dart';
import 'package:aqua_trace/features/Aqua_Trace/widgets/trackedList.dart';
import 'package:aqua_trace/models/list.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class AquaTrace extends StatefulWidget {
  const AquaTrace({super.key});

  @override
  State<AquaTrace> createState() => _AquaTraceState();
}

class _AquaTraceState extends State<AquaTrace> {
  double total = 3800;
  bool loading = true;

  List<IncomingList> inList = [];

  void getTotal() async {
    List<IncomingList> inLists = await getItemsRepo.getList();
    double p_total = await getItemsRepo.getTotal();
    setState(() {
      inList = inLists;
      total = p_total;
    });
  }

  void _getTotalByDate(List<IncomingList> lists, double _total) async {
    setState(() {
      inList = lists;
      total = _total;
    });
  }

  void _analytics() async {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    await analytics.logEvent(
        name: 'pages_tracked',
        parameters: {"page_name": 'Aquatrace', "page_index": 2});
  }

  @override
  void initState() {
    _analytics();
    getTotal();
    loading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading == false
        ? Scaffold(
            // appBar: AppBar(
            //   title: const Text(
            //     'WATER FOOTPRINT',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.white,
            //       fontSize: 25.5,
            //     ),
            //   ),
            //   backgroundColor: Color.fromARGB(255, 24, 94, 247),
            //   centerTitle: true,
            //   shape: const RoundedRectangleBorder(
            //       borderRadius: BorderRadius.only(
            //     bottomRight: Radius.circular(100),
            //     bottomLeft: Radius.circular(100),
            //   )),
            //   toolbarHeight: 75,
            // ),
            body: Container(
                child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                TopBar(_getTotalByDate),
                const SizedBox(height: 60),
                chartWidget(
                  total: total,
                  list_length: inList.length,
                ),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.only(right: 260),
                  child: const Text('Tracked List'),
                ),
                Expanded(
                    child: TrackedList(
                  inList: inList,
                ))
              ],
            )),
          )
        : CircularProgressIndicator();
  }
}
