import 'package:flutter/material.dart';
import 'package:seledriaarduino/models/models.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

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
    if (mounted) {
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
      body: ListView.builder(
        // ignore: unnecessary_null_comparison
        itemCount: userdata == null ? 0 : userdata.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Image.asset('assets/icons/icon5.png'),
              title: Text(userdata[index]["kondisi"] == "1"
                  ? "Atap Di Naikan"
                  : "Atap di turunkan"),
              subtitle: Text("${userdata[index]["waktu"]}"),
            ),
          );
        },
      ),
    );
  }
}
