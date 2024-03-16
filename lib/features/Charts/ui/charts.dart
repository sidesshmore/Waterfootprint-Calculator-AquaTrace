import 'package:aqua_trace/features/Charts/ui/chat_interface.dart';
import 'package:aqua_trace/features/Charts/ui/water_card.dart';
import 'package:aqua_trace/models/foodCardData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({super.key});

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    foodList;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          Text(
            'Aqua Info',
            style: TextStyle(
                fontSize: height * 0.045, fontWeight: FontWeight.bold),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                height: height * 0.47,
                child: Swiper(
                  duration: 1200,
                  itemCount: foodList.length,
                  itemBuilder: (context, index) {
                    return WaterCard(
                      foodURL: foodList[index].foodURL,
                      foodName: foodList[index].foodName,
                      blueWFP: foodList[index].blueWFP,
                      greenWFP: foodList[index].greenWFP,
                      greyWFP: foodList[index].greyWFP,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        child: Icon(
          Icons.smart_toy,
          color: Colors.white,
          size: height * 0.033,
        ),
        backgroundColor: Colors.blue.shade600,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return ChatInterface();
              });
        },
      ),
    );
  }
}
