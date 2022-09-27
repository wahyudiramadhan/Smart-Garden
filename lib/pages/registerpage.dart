import 'dart:ui';

import 'package:flash/src/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:seledriaarduino/models/models.dart';
import 'package:seledriaarduino/pages/loginpage.dart';
import 'package:seledriaarduino/pages/mainpage.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Register dataResponse = Register();
  @override
  Widget build(BuildContext context) {
    var userController = TextEditingController();
    var namaController = TextEditingController();
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
                              "Daftar",
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
                          controller: namaController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'Nama Panggilan(tanpa spasi)',
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: 'Password',
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (userController.text.isEmpty &&
                                    namaController.text.isEmpty &&
                                    passController.text.isEmpty) {
                                  context.showToast('data tidak boleh kosong');
                                } else {
                                  Register.reg(
                                          userController.text,
                                          namaController.text,
                                          passController.text)
                                      .then((value) {
                                    if (this.mounted) {
                                      setState(() {
                                        dataResponse = value;
                                      });
                                      if (dataResponse.response_status ==
                                          'SUCCESS') {
                                        context.showToast('Daftar Berhasil');
                                        Get.back();
                                      } else {
                                        context.showToast('gagal');
                                      }
                                    }
                                  });
                                }
                              },
                              child: Text("Daftar"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Get.back();
                    // Future.delayed(Duration(milliseconds: 300), () {
                    //   Get.back();
                    // });
                  },
                  child: Text("Sudah Punya Akun? Masuk"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
