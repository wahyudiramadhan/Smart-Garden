import 'package:flutter/material.dart';
import 'package:seledriaarduino/models/models.dart';
import 'package:seledriaarduino/pages/splash.dart';

class NameCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 25.0,
              spreadRadius: 0.5,
              offset: Offset(
                5.0,
                15.0,
              ),
            ),
          ],
          color: Colors.tealAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.teal.shade600,
              Colors.teal.shade300,
            ],
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
            ),
            Text(
              "Welcome, ${finalnama}",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class ControllingCard extends StatelessWidget {
  ControllingCard({
    required this.DataSensor,
  });
  final Getsensor DataSensor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        viewData(),
      ],
    );
  }

  Container viewData() {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.teal,
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 25.0,
              spreadRadius: 0.5,
              offset: Offset(
                15.0,
                5.0,
              ),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff009688),
              Color(0xff009688),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              seledriimg(),
              SizedBox(height: 15),
              statuskebun(),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text(
                          "Cahaya",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          (DataSensor.cahaya == null)
                              ? "null"
                              : "${DataSensor.cahaya}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.thermostat,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text(
                          "Kelembapan",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          (DataSensor.kelembapan == null)
                              ? "null"
                              : "${DataSensor.kelembapan}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.cloud_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text(
                          "Hujan ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          (DataSensor.hujan == null)
                              ? "null"
                              : "${DataSensor.hujan}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 15),
              btn_control(),
            ],
          ),
        ),
      );
  }

  Column statuskebun() {
    return Column(
                    children: [
                      Icon(
                        Icons.door_sliding,
                        color: DataSensor.status == "1" ? Colors.green : DataSensor.status == "2" ? Colors.red : Colors.grey,
                        size: 70,
                      ),
                      Text(
                        "Status",
                        style: TextStyle(
                          color: DataSensor.status == "1" ? Colors.green : DataSensor.status == "2" ? Colors.red : Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        (DataSensor.status == null)
                            ? "null"
                            : "${DataSensor.status == "1" ? "NAIK" : DataSensor.status == "2" ? "TURUN" : "STOP"}",
                        style: TextStyle(
                          color: DataSensor.status == "1" ? Colors.green : DataSensor.status == "2" ? Colors.red : Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  );
  }

  Row btn_control() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Updatesensor.update("1", "1");
                      Duration(seconds: 5);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.greenAccent[700]),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "NAIK",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.arrow_circle_up,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    )),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Updatesensor.update("1", "2");
                    Duration(seconds: 5);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red[700]),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "TURUN ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),

                      ),
                      Icon(
                        Icons.arrow_circle_down,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Updatesensor.update("1", "0");
                    Duration(seconds: 5);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "STOP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.stop,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ],
            );
  }

  Container seledriimg() {
    return Container(
        height: 160.0,
        width: 160.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/seledri1.png'),
            fit: BoxFit.fill,
          ),
          shape: BoxShape.circle,
        ),
      );
  }
}
