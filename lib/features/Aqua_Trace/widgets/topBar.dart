import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  bool todaySelected = true;
  bool thisweekSelected = false;
  bool thismonthSelected = false;
  bool sixmonthSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: TextButton(
              onPressed: () {
                setState(() {
                  todaySelected = true;
                  thisweekSelected = false;
                  thismonthSelected = false;
                  sixmonthSelected = false;
                });
              },
              style: TextButton.styleFrom(
                  backgroundColor: todaySelected
                      ? const Color.fromARGB(255, 24, 94, 247)
                      : const Color.fromRGBO(216, 216, 216, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Text(
                'Today',
                style: TextStyle(
                    color: todaySelected ? Colors.white : Colors.black,
                    fontSize: 15),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: TextButton(
              onPressed: () {
                setState(() {
                  todaySelected = false;
                  thisweekSelected = true;
                  thismonthSelected = false;
                  sixmonthSelected = false;
                });
              },
              style: TextButton.styleFrom(
                  backgroundColor: thisweekSelected
                      ? const Color.fromRGBO(52, 104, 192, 1)
                      : const Color.fromRGBO(216, 216, 216, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Text(
                'This Week',
                style: TextStyle(
                    color: thisweekSelected ? Colors.white : Colors.black,
                    fontSize: 15),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: TextButton(
              onPressed: () {
                setState(() {
                  todaySelected = false;
                  thisweekSelected = false;
                  thismonthSelected = true;
                  sixmonthSelected = false;
                });
              },
              style: TextButton.styleFrom(
                  backgroundColor: thismonthSelected
                      ? const Color.fromRGBO(52, 104, 192, 1)
                      : const Color.fromRGBO(216, 216, 216, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Text(
                'This month',
                style: TextStyle(
                    color: thismonthSelected ? Colors.white : Colors.black,
                    fontSize: 15),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: TextButton(
              onPressed: () {
                setState(() {
                  todaySelected = false;
                  thisweekSelected = false;
                  thismonthSelected = false;
                  sixmonthSelected = true;
                });
              },
              style: TextButton.styleFrom(
                  backgroundColor: sixmonthSelected
                      ? const Color.fromRGBO(52, 104, 192, 1)
                      : const Color.fromRGBO(216, 216, 216, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Text(
                '6 Months',
                style: TextStyle(
                    color: sixmonthSelected ? Colors.white : Colors.black,
                    fontSize: 15),
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
