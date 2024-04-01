import 'dart:io';

import 'package:aqua_trace/features/Profile_Screen/widgets/github_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_icons/simple_icons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? userName = '';
  AssetImage? selectedImage;

  void setName() async {
    var user = await auth.currentUser;
    setState(() {
      selectedImage=user!.photoURL==null?const AssetImage('assets/profile_avatar/Drop1.png'):AssetImage(user.photoURL.toString());
      userName = user!.displayName;
    });
  }

  @override
  void initState() {
    setName();
    super.initState();
  }

  Future<void> _showImageSelectionDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose Profile Image"),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildImageOption('assets/profile_avatar/Drop1.png'),
                _buildImageOption('assets/profile_avatar/Drop2.png'),
                _buildImageOption('assets/profile_avatar/Drop3.png'),
                _buildImageOption('assets/profile_avatar/Drop4.png'),
                _buildImageOption('assets/profile_avatar/Drop5.png'),
                _buildImageOption('assets/profile_avatar/Drop6.png'),
                _buildImageOption('assets/profile_avatar/Drop7.png'),
                _buildImageOption('assets/profile_avatar/Drop8.png'),
                _buildImageOption('assets/profile_avatar/Drop9.png'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageOption(String imagePath) {
    return InkWell(
      onTap: () async{
        setState(() {
          selectedImage = AssetImage(imagePath.toString());
        });
        var user =  auth.currentUser;
          await user!.updatePhotoURL(imagePath.toString());
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          imagePath,
          height: 50,
          width: 50,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Uri sidessh = Uri.parse('https://github.com/sidesshmore');
    final Uri shakthi = Uri.parse('https://github.com/SHAKTHI-VEL');
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return GithubCard();
                    });
              },
              child: const Icon(
                SimpleIcons.github,
                color: Colors.black,
                size: 32,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  InkWell(
                    onTap: _showImageSelectionDialog,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: selectedImage,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.only(top: 20, left: 5),
                    onPressed: _showImageSelectionDialog,
                    icon: Icon(Icons.edit),
                    iconSize: 25,
                  )
                ],
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
