// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, camel_case_types

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seledriaarduino/components/card.dart';

import 'package:seledriaarduino/models/models.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginpage.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Getsensor DataSensor = Getsensor();

  getVal() {
    if (mounted) {
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
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitialize = IOSInitializationSettings();
    // ignore: unnecessary_new
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iosInitialize);
    localNotification = FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
    Timer.periodic(Duration(milliseconds: 2000), (timer) {
      getVal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            child: Image.asset('assets/images/img1.png'),
          ),
          Column(
            children: [
              SizedBox(height: 30),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                  ),
                  onPressed: () async {
                    final SharedPreferences sharedpreference =
                        await SharedPreferences.getInstance();
                    sharedpreference.remove('nama');
                    Get.offAll(() => LoginPage());
                  },
                  label: Text(
                    "Exit",
                    style: TextStyle(color: Colors.grey),
                  ),
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
              ),
              NameCard(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              ControllingCard(DataSensor: DataSensor),
            ],
          ),
        ],
      ),
    );
  }
}
