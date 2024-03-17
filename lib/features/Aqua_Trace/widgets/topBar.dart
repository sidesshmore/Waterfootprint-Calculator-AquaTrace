import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  DateTime _selectedDate = DateTime.now(); // Track selected date

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String buttonText = DateFormat('dd MMM, yyyy')
        .format(_selectedDate); // Format the selected date as "17 Nov, 2024"

    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: screenWidth / 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 19),
            ),
          ),
          InkWell(
            onTap: () {
              _showDatePicker(context);
            },
            child: CircleAvatar(
              child: Icon(Icons.calendar_month_outlined),
            ),
          )
        ],
      ),
    );
  }

  // Function to show the date picker
  Future<void> _showDatePicker(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
