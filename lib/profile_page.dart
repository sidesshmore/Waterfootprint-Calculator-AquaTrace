import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings_rounded),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
          ]),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          const Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/memoji2.JPEG'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Sidessh More',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          ...List.generate(customListItems.length, (index) {
            final tile = customListItems[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Card(
                elevation: 4,
                shadowColor: Colors.black12,
                child: ListTile(
                  leading: Icon(tile.icon),
                  title: Text(tile.title),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class CustomListItem {
  final IconData icon;
  final String title;
  CustomListItem({
    required this.icon,
    required this.title,
  });
}

List<CustomListItem> customListItems = [
  CustomListItem(
    icon: Icons.edit,
    title: "Change Details",
  ),
  CustomListItem(
    icon: Icons.bug_report_outlined,
    title: "Report Bug",
  ),
  CustomListItem(
    title: "Notifications",
    icon: Icons.notifications,
  ),
  CustomListItem(
    title: "Logout",
    icon: Icons.logout,
  ),
];
