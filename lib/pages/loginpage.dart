import 'dart:async';
import 'dart:ui';

import 'package:flash/src/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:seledriaarduino/models/models.dart';
import 'package:seledriaarduino/pages/mainpage.dart';
import 'package:seledriaarduino/pages/registerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Login dataRespons = Login();

  @override
  Widget build(BuildContext context) {
    var userController = TextEditingController();
    var passController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-droid-1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: new EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Masuk",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w900,
                                color: Colors.teal,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          controller: userController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'Username ',
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: 'Password ',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                if (userController.text.isEmpty &&
                                    passController.text.isEmpty) {
                                  context.showToast(
                                      'username dan password tidak boleh kosong');
                                } else {
                                  Login.connect(
                                      userController.text, passController.text);
                                }
                              },
                              child: Text("Masuk"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Get.to(() => RegisterPage());
                  },
                  child: Text("Belum Punya Akun? Daftar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
