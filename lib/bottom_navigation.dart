import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: 4,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'share');
              },
              child: const Icon(
                CupertinoIcons.share,
                size: 25,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'charts');
              },
              child: const Icon(
                CupertinoIcons.chart_bar_alt_fill,
                size: 25,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 24, 94, 247),
              radius: 25,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'aqua_trace');
                },
                child: const Icon(
                  CupertinoIcons.drop_fill,
                  color: Colors.white,
                  size: 33,
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'blog');
              },
              child: const Icon(
                CupertinoIcons.book_fill,
                size: 25,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'profile');
              },
              child: const Icon(
                CupertinoIcons.person,
                size: 25,
              ),
            ),
            label: '',
          )
        ]);
  }
}
