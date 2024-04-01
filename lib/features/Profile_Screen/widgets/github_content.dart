import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubCard extends StatelessWidget {
  const GithubCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri sidessh = Uri.parse('https://github.com/sidesshmore');
    final Uri shakthi = Uri.parse('https://github.com/SHAKTHI-VEL');
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.44,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
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
                          fontWeight: FontWeight.w600, color: Colors.white),
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
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
