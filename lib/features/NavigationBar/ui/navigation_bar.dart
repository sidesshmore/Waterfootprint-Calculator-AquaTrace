import 'package:aqua_trace/features/Add_Modal/add_modal.dart';
import 'package:aqua_trace/features/Aqua_Trace/ui/aqua_trace.dart';
import 'package:aqua_trace/features/Blog/ui/blog.dart';
import 'package:aqua_trace/features/Charts/ui/charts.dart';
import 'package:aqua_trace/features/Profile_Screen/ui/profile_page.dart';
import 'package:aqua_trace/features/Share_Screen/ui/share.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:showcaseview/showcaseview.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final keyOne = GlobalKey();
  int _selectedIndex = 2;

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => AddModal());
  }

  static List pageNames = [
    'ShareScreen',
    'InfoPage',
    'Aquatrace',
    'BlogPage',
    'ProfilePage'
  ];

  final List<Widget> _widgetOptions = <Widget>[
    ShareScreen(),
    const ChartsPage(),
    const AquaTrace(),
    const BlogPage(),
    const ProfilePage()
  ];

  void _onItemTapped(int index) async {
    await analytics.logEvent(
        name: 'pages_tracked',
        parameters: {"page_name": pageNames[index], "page_index": index});

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    analytics.setAnalyticsCollectionEnabled(true);
   
    super.initState();
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
              CupertinoIcons.lightbulb_fill,
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
                   WidgetsBinding.instance.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context).startShowCase([
        keyOne,
      ]),
    );
                  _selectedIndex = 2;
                });
              },
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 24, 94, 247),
                radius: 25,
                child: Showcase(
                  tooltipBackgroundColor: Colors.blue,
                  tooltipBorderRadius: BorderRadius.circular(10),
                  targetBorderRadius: BorderRadius.circular(30),
                  targetPadding: EdgeInsets.all(10),
                  descTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14),
                  blurValue: 1,
                  key: keyOne,
                  description: "Double Tap to track",
                  child: const Icon(
                    CupertinoIcons.drop_fill,
                    color: Colors.white,
                    size: 33,
                  ),
                ),
              ),
            ),
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
