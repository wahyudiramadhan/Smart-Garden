// ignore_for_file: implementation_imports

import 'package:flash/src/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seledriaarduino/models/models.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          image: const DecorationImage(
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
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              "Daftar",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w900,
                                color: Colors.teal,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 40),
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
                        const SizedBox(height: 10),
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
                                    if (mounted) {
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
                              child: const Text("Daftar"),
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
                  child: const Text("Sudah Punya Akun? Masuk"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
