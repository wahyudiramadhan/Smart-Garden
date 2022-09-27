import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seledriaarduino/pages/loginpage.dart';
import 'package:seledriaarduino/pages/reportpage.dart';
import 'package:seledriaarduino/pages/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.teal.shade600,
                  Colors.teal.shade400,
                ],
              ),
            ),
            child: Text(
              "Hi ${finalnama}",
              style: TextStyle(
                color: Colors.white, //tag name in nav bar
                fontSize: 16,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard, color: Colors.teal),
            title: Text('Menu Utama'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.task, color: Colors.teal),
            title: Text('Laporan'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() => ReportPage());
            },
          ),
          ListTile(
              leading: Icon(Icons.logout, color: Colors.teal),
              title: Text("Keluar"),
              onTap: () async {
                final SharedPreferences sharedpreference =
                    await SharedPreferences.getInstance();
                sharedpreference.remove('nama');
                Get.offAll(() => LoginPage());
              }),
        ],
      ),
    );
  }
}
