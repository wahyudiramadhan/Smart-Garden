// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seledriaarduino/components/card.dart';
import 'package:seledriaarduino/components/menu.dart';
import 'package:seledriaarduino/models/models.dart';
import 'package:seledriaarduino/pages/loginpage.dart';
import 'package:seledriaarduino/pages/reportpage.dart';
import 'package:seledriaarduino/pages/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Getsensor DataSensor = Getsensor();

  getVal() {
    if (this.mounted) {
      Getsensor.get().then((value) async {
        setState(() {
          DataSensor = value;
        });
      });
    }
  }

  late FlutterLocalNotificationsPlugin localNotification;

  @override
  void initState() {
    super.initState();
    var androidInitialize =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iosInitialize);
    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
    Timer.periodic(Duration(milliseconds: 2000), (timer) {
      getVal();
    });
  }

  void _showNotification() async {
    print("notif");
    var androidDetails = new AndroidNotificationDetails(
      "0",
      "channelName",
      // "channelDescription",
      importance: Importance.high,
    );
    var iosDetail = new IOSNotificationDetails();
    var generalNotificationDetails = new NotificationDetails(
      android: androidDetails,
      iOS: iosDetail,
    );
    await localNotification.show(
      0,
      "title",
      "pesan",
      generalNotificationDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppbar(),
      drawer: NavMenu(),
      body: Container(
        height: double.infinity,
        color: Colors.teal.shade800,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      _showNotification();
                    },
                    child: Text("hehe")),
                NameCard(),
                SizedBox(
                  height: 10,
                ),
                ControllingCard(DataSensor: DataSensor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar mainAppbar() {
    return AppBar(
      backgroundColor: Colors.teal.shade800,
      elevation: 0, // 1
      title: Text(
        "SELEDRI IOT",
        style: TextStyle(
          color: Colors.white,
        ),
      ),

      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          onPressed: () {
            getVal();
          },
        )
      ],
    );
  }
}
