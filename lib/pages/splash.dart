import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seledriaarduino/pages/loginpage.dart';
import 'package:seledriaarduino/pages/homepage.dart';
import 'package:seledriaarduino/pages/tabs_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalnama;

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    getValidation().whenComplete(() {
      Timer(
          const Duration(seconds: 2),
          () => Get.offAll(
              () => finalnama == null ? const LoginPage() : tabsPage()));
    });
  }

  getValidation() async {
    final SharedPreferences sharedpreference =
        await SharedPreferences.getInstance();
    var obtainnama = sharedpreference.getString('nama');
    setState(() {
      finalnama = obtainnama;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_splash.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
