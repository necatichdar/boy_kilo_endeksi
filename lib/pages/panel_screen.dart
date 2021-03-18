import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PanelScreen extends StatefulWidget {
  @override
  _PanelScreenState createState() => _PanelScreenState();
}

class _PanelScreenState extends State<PanelScreen> {
  String imgUrl =
      "https://images.pexels.com/photos/1032650/pexels-photo-1032650.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";

  String runningMan =
      "https://g7.pngresmi.com/preview/419/16/61/knee-pain-arthritis-pain-joint-pain-others.jpg";

  String man1 = "assets/images/man1.png";
  String man = "assets/images/man.png";
  bool ture = false;
  Timer timer;

  int margin = 0;

  Stopwatch _stopwatch;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }

  void handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      print("stop ici");
    } else {
      _stopwatch.start();
      print("start ici");
    }
    setState(() {}); // re-render the page
  }

  voidYardir() {
    voidBoolean();
    if (margin > 230) {
      setState(() {
        margin = 0;
      });
    } else {
      setState(() {
        margin += 5;
      });
    }
  }

  marginUpdate() {
    if (margin > 230) {
      setState(() {
        margin = 0;
      });
    } else {
      setState(() {
        margin += 5;
      });
    }
  }

  voidBoolean() {
    setState(() {
      ture = !ture;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: MyFloatingActionButton(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                imgUrl,
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            topBar(size),
            buildCircular(size),
            bodyButton(),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: margin.toDouble()),
                  height: size.height * 0.2,
                  child: Image.asset(ture ? man : man1),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding bodyButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: FaIcon(FontAwesomeIcons.bolt),
          ),
        ],
      ),
    );
  }

  FloatingActionButton MyFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        handleStartStop();
        // voidBoolean();
      },
      label: Text("Yeni Ekle"),
    );
  }

  Container buildCircular(Size size) {
    return Container(
      height: size.height * 0.32,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Baslangic",
                style: GoogleFonts.daysOne(fontSize: 16),
              ),
              buildContainer(size, 0.05, 0.2),
            ],
          ),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  Border.all(color: Colors.black.withOpacity(.5), width: 15),
            ),
            child: Center(
              child: Text(
                "67.0 KG",
                style: GoogleFonts.bebasNeue(
                  fontSize: 48,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hedef",
                style: GoogleFonts.daysOne(fontSize: 16),
              ),
              buildContainer(size, 0.05, 0.2),
            ],
          ),
        ],
      ),
    );
  }

  Row topBar(Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            buildContainer(size, 0.05, 0.33),
            buildContainer(size, 0.05, 0.33),
          ],
        ),
        Column(
          children: [
            buildContainer(size, 0.065, 0.33),
            Container(
              height: 29,
              width: size.width * 0.33,
              color: Colors.red,
            )
          ],
        ),
        Column(
          children: [
            buildContainer(size, 0.05, 0.33),
            buildContainer(size, 0.05, 0.33),
          ],
        ),
      ],
    );
  }

  Container buildContainer(Size size, double yukseklik, double genislik) {
    return Container(
      height: size.height * yukseklik,
      width: size.width * genislik,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(.5),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      padding: const EdgeInsets.all(.0),
      child: Column(
        children: [
          Expanded(
            child: Text(
              "VKI",
              style: GoogleFonts.sancreek(
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Text(
            "28.7",
            style:
                GoogleFonts.reemKufi(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
