import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? userName = '';

  void setName() async {
    var user = await auth.currentUser;
    setState(() {
      userName = user!.displayName;
    });
  }

  @override
  void initState() {
    setName();
    super.initState();
  }
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
    final Uri sidessh = Uri.parse('https://github.com/sidesshmore');
    final Uri shakthi = Uri.parse('https://github.com/SHAKTHI-VEL');
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/AquaSoldier.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '$userName',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          ...List.generate(customListItems.length, (index) {
            final tile = customListItems[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: InkWell(
                onTap: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove('uid');
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'login', (route) => false);
                },
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.black12,
                  child: ListTile(
                    leading: Icon(tile.icon),
                    title: Text(tile.title),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
              ),
            );
          }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.001,
          ),
          Container(
            height: height * 0.44,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Lottie.asset("assets/eKrpqJAJmP.json",
                    height: height * 0.25, fit: BoxFit.fill),
                Text(
                  'Developed by Team Bit Busters❤️',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.05,
                      color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          launchUrl(sidessh);
                        },
                        child: const ListTile(
                          leading: Icon(
                            SimpleIcons.github,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Sidessh',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          launchUrl(shakthi);
                        },
                        child: const ListTile(
                          leading: Icon(
                            SimpleIcons.github,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Shakthivel',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
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
    title: "Logout",
    icon: Icons.logout,
  ),
];
