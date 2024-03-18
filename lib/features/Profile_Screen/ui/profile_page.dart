import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String? userName='';

  // void getUsername()async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //  String? name= await prefs.getString('uid');
  //   setState(() {
  //     userName=name;
  //   });
  // }

  // @override
  // void initState(){
  //   // getUsername();
  //   super.initState();
  // }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
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
                'Aqua Soldier',
                style:  TextStyle(
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
