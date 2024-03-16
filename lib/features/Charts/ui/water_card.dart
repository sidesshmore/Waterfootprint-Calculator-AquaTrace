import 'package:aqua_trace/models/foodCardData.dart';
import 'package:flutter/material.dart';

class WaterCard extends StatelessWidget {
  const WaterCard({
    super.key,
    required this.foodURL,
    required this.foodName,
    required this.blueWFP,
    required this.greenWFP,
    required this.greyWFP,
  });

  final String foodURL;
  final String foodName;
  final String blueWFP;
  final String greenWFP;
  final String greyWFP;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    foodList;
    return Card(
      color: Colors.white,
      elevation: 3,
      shadowColor: Colors.grey.shade600,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                foodURL,
                height: height * 0.24,
                fit: BoxFit.fill,
                width: width * 0.86,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  foodName,
                  style: TextStyle(
                      fontSize: width * 0.068, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Blue Water Footprint",
                      style: TextStyle(
                          fontSize: width * 0.038, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Gray Water Footprint",
                      style: TextStyle(
                          fontSize: width * 0.038, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Green Water Footprint",
                      style: TextStyle(
                          fontSize: width * 0.038, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      blueWFP,
                      style: TextStyle(
                          fontSize: width * 0.04, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      greyWFP,
                      style: TextStyle(
                          fontSize: width * 0.04, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      greenWFP,
                      style: TextStyle(
                          fontSize: width * 0.04, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'all values are for per kg',
                  style: TextStyle(fontSize: height * 0.012),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
