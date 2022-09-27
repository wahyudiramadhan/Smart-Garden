import 'package:flutter/material.dart';
import 'package:seledriaarduino/models/models.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seledriaarduino/pages/splash.dart';

class ReportPage extends StatefulWidget {
  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late Map data;
  late List userdata = [];

  Future getData() async {
    Uri url = Uri.parse(server + "/report.php");
    http.Response response = await http.get(url);
    data = json.decode(response.body);
    if (this.mounted) {
      setState(() {
        setState(() {
          userdata = data["data"];
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Laporan"),
      ),
      body: ListView.builder(
        itemCount: userdata == null ? 0 : userdata.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.task),
              title: Text("${userdata[index]["kondisi"] == "1" ? "Atap Di Naikan" : "Atap di turunkan"}"),
              subtitle: Text("${userdata[index]["waktu"]}"),
            ),
          );
        },
      ),
    );
  }
}
