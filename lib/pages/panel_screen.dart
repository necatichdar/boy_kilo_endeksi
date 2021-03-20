import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PanelScreen extends StatefulWidget {
  @override
  _PanelScreenState createState() => _PanelScreenState();
}

class _PanelScreenState extends State<PanelScreen> {
  String imgUrl = "assets/images/background.jpeg";

  String man1 = "assets/images/man1.png";
  String man = "assets/images/man.png";
  bool ture = false;
  int margin = 0;
  double kaydirmaPadding = 0.0;

  voidYardir() {
    voidBoolean();
    if (margin > 230) {
      setState(() {
        margin = 0;
      });
    } else {
      setState(() {
        margin += 5;
        kaydirmaPadding += 2.3;
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
              image: AssetImage(
                imgUrl,
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            topBar(size),
            buildCircular(size),
            bodyButton(size),
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

  Padding bodyButton(Size size) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              showBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return Container(
                    height: size.height * .2,
                    width: size.width,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(.5),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50)
                          )
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                              width: size.width,
                              padding: EdgeInsets.all(20),
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_downward_outlined,
                              ),
                            ),
                            onTap: () => Navigator.pop(context),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: FaIcon(FontAwesomeIcons.bolt),
          ),
        ],
      ),
    );
  }

  FloatingActionButton MyFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        voidYardir();
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
              buildContainer("", "24", false, size, 0.05, 0.2),
            ],
          ),
          CircularPercentIndicator(
            radius: 180.0,
            startAngle: 0,
            lineWidth: 20.0,
            percent: 0.8,
            center: new Text("80%"),
            progressColor: Colors.deepPurpleAccent,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hedef",
                style: GoogleFonts.daysOne(fontSize: 16),
              ),
              buildContainer("", "24", false, size, 0.05, 0.2),
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
            buildContainer("VKI", "28.7", true, size, 0.05, 0.33),
            buildContainer("Kilolu", "Erkek", false, size, 0.05, 0.33),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildContainer("Verilen", "0.0", true, size, 0.065, 0.33),
            Container(
              height: size.height * 0.040,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.alarm_add_outlined,
                  ),
                  Container(
                    width: 100,
                    height: size.height * 0.018,
                    color: Colors.blue,
                    padding: EdgeInsets.only(
                      left: kaydirmaPadding,
                    ),
                    child: Container(
                      height: size.height * 0.018,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Column(
          children: [
            buildContainer("Kalan", "12.9", true, size, 0.05, 0.33),
            buildContainer(
                "Baslangic : 21.03", "Bitis : 29.03", false, size, 0.05, 0.33),
          ],
        ),
      ],
    );
  }

  Container buildContainer(String text, String deger, bool yaziVarMi, Size size,
      double yukseklik, double genislik) {
    return Container(
      height: size.height * yukseklik,
      width: size.width * genislik,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(.25),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      padding: const EdgeInsets.all(.0),
      child: Column(
        children: [
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.reemKufi(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.yellow.shade900,
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Text(
            yaziVarMi ? "$deger kg" : "$deger",
            style: GoogleFonts.reemKufi(
              fontSize: 14,
              color: Colors.yellow.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
