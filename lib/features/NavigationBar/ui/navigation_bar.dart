import 'package:aqua_trace/features/Add_Modal/add_modal.dart';
import 'package:aqua_trace/features/Aqua_Trace/ui/aqua_trace.dart';
import 'package:aqua_trace/features/Blog/ui/blog.dart';
import 'package:aqua_trace/features/Charts/ui/charts.dart';
import 'package:aqua_trace/features/Profile_Screen/ui/profile_page.dart';
import 'package:aqua_trace/features/Share_Screen/ui/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 2;

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      
        isScrollControlled: true,
        context: context,
        builder: (ctx) => AddModal());
  }

  final List<Widget> _widgetOptions = <Widget>[
    ShareScreen(),
    const ChartsPage(),
    const AquaTrace(),
    const BlogPage(),
    const ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(

      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.share,
              size: 25,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.chart_bar_alt_fill,
              size: 25,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
                onDoubleTap: () {
                  _openAddExpenseOverlay();
                },
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                child: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 24, 94, 247),
                  radius: 25,
                  child: Icon(
                    CupertinoIcons.drop_fill,
                    color: Colors.white,
                    size: 33,
                  ),
                )),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.book_fill,
              size: 25,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person,
              size: 25,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
