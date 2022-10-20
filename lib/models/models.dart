// ignore_for_file: prefer_typing_uninitialized_variables, unused_element, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:seledriaarduino/pages/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

var server = "http://www.seledriiot.host";

class Login {
  String msg = '';
  var nama, response_status;
  Login({this.response_status, this.nama});

  static Future<Login> connect(String username, String password) async {
    Uri url = Uri.parse(server + '/login.php');

    var hasilResponse = await http.post(
      url,
      body: {"username": username, "password": password},
    );

    var data = json.decode(hasilResponse.body);

    if (data["response_status"] == "OK") {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString("nama", data["data"]["nama"]);

      Get.offAll(() => const SplashPage());
    } else {}
    return Login(
      response_status: "gagal",
    );
  }
}

class Register {
  var response_status;
  Register({this.response_status});

  static Future<Register> reg(
      String username, String nama, String password) async {
    Uri url = Uri.parse(server + '/regist.php');

    var hasilResponse = await http.post(
      url,
      body: {"username": username, "nama": nama, "password": password},
    );

    var data = json.decode(hasilResponse.body);

    return Register(
      response_status: data['response_status'],
    );
  }
}

class Getsensor {
  var id, cahaya, kelembapan, hujan, status;
  Getsensor({this.id, this.cahaya, this.kelembapan, this.hujan, this.status});

  static Future<Getsensor> get() async {
    // Uri url = Uri.parse(server + "/get.php?username=${finalnama}");
    Uri url = Uri.parse(server + "/get.php");

    var hasilResponse = await http.get(url);

    // print(hasilResponse.body);
    var data = json.decode(hasilResponse.body);

    var pintu = data["data"]["status"];

    return Getsensor(
      id: data["id"],
      cahaya: data["data"]["cahaya"],
      kelembapan: data["data"]["kelembapan"],
      hujan: data["data"]["hujan"],
      status: pintu,
    );
  }
}

class Updatesensor {
  var response_status;
  Updatesensor({this.response_status});

  static Future<Updatesensor> update(String id, String status) async {
    Uri url = Uri.parse(server + "/update.php");

    var hasilResponse = await http.post(
      url,
      body: {"id": id, "status": status},
    );
    var data = json.decode(hasilResponse.body);
    // print(data["response_status"]);

    return Updatesensor(
      response_status: data['response_status'],
    );
  }
}
