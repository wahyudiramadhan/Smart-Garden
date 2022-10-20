// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seledriaarduino/models/models.dart';
import 'package:seledriaarduino/pages/splash.dart';

class NameCard extends StatelessWidget {
  const NameCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .98,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Welcome, $finalnama 🌿",
          style: GoogleFonts.notoSerifDisplay(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class ControllingCard extends StatelessWidget {
  const ControllingCard({
    Key? key,
    required this.DataSensor,
  }) : super(key: key);
  final Getsensor DataSensor;
  @override
  Widget build(BuildContext context) {
    var customwidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: customwidth * 0.325,
              height: 100,
              child: cardData('Light', 'icon4.png', DataSensor.cahaya),
            ),
            SizedBox(
              width: customwidth * 0.325,
              height: 100,
              child:
                  cardData('Temperature', 'icon1.png', DataSensor.kelembapan),
            ),
            SizedBox(
              width: customwidth * 0.325,
              height: 100,
              child: cardData('Rain', 'icon2.png', DataSensor.hujan),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: customwidth * 0.45,
              height: 100,
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(
                    //   Icons.door_sliding,
                    //   color: DataSensor.status == "1"
                    //       ? Color(0xff0C9359)
                    //       : DataSensor.status == "2"
                    //           ? Colors.red.shade300
                    //           : Colors.grey.shade300,
                    //   size: 70,
                    // ),
                    Text(
                      (DataSensor.status == null)
                          ? "null"
                          : DataSensor.status == "1"
                              ? "Atap Naik"
                              : DataSensor.status == "2"
                                  ? "Atap Turun"
                                  : "Atap Berhenti",
                      style: TextStyle(
                        color: DataSensor.status == "1"
                            ? Color(0xff0C9359)
                            : DataSensor.status == "2"
                                ? Colors.red.shade300
                                : Colors.grey.shade300,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: customwidth * 0.25,
              height: 100,
              child: Row(
                children: [
                  SizedBox(
                    width: customwidth * 0.24,
                    height: 90,
                    child: ElevatedButton(
                      onPressed: () {
                        Updatesensor.update("1", "1");
                        const Duration(seconds: 5);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.greenAccent[700]),
                      ),
                      child: const Icon(
                        Icons.arrow_circle_up,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: customwidth * 0.24,
              height: 90,
              child: ElevatedButton(
                onPressed: () {
                  Updatesensor.update("1", "2");
                  const Duration(seconds: 5);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red[700]),
                ),
                child: const Icon(
                  Icons.arrow_circle_down,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Card cardData(String titlename, String icon, var sensor) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/icons/$icon'),
            Text(
              titlename,
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              (sensor == null) ? "null" : "$sensor",
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
