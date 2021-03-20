import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';

class YeniKiloScreen extends StatefulWidget {
  @override
  _YeniKiloScreenState createState() => _YeniKiloScreenState();
}

class _YeniKiloScreenState extends State<YeniKiloScreen> {
  double kilo = 80.5;
  bool isCheck = false;
  double kiloDegeri = 75.0;
  double belDegeri = 30.0;
  double kalcaDegeri = 90.0;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(

              content: Text(
                "Başarıyla Eklendi",
              ),
            ),
          );
        },
      ),
      body: GestureDetector(
        onTap: () {
          currentFocus.unfocus();
        },
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text(
              "Yeni Kilo",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.black),
            ),
            emptyMedium(size),
            GestureDetector(
              onTap: () {
                _selectDate(context);
                //textController.text = selectedDate.toLocal().toString().split(' ')[0];
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                    color: Colors.red,
                  ),
                ),
                child: Text(
                  "${selectedDate.toLocal()}".split(' ')[0],
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            emptyMedium(size),
            Text("Kilo"),
            emptyLow(size),
            GestureDetector(
              onTap: () {
                myBottomSheet(context, size, kiloDegeri);
              },
              child: Container(
                height: size.height * 0.05,
                child: Center(
                  child: Text(
                    kilo.toString(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(2),
                  ),
                  border: Border.all(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isCheck,
                      onChanged: (value) {
                        setState(() {
                          isCheck = value;
                        });
                        print(isCheck);
                      },
                    ),
                    Text(
                      "Vücut Ölçüsünü Gir",
                      style: Theme.of(context).textTheme.button,
                    )
                  ],
                ),
                FaIcon(FontAwesomeIcons.bolt),
              ],
            ),
            isCheck
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bel",
                      ),
                      emptyLow(size),
                      GestureDetector(
                        onTap: () {
                          myBottomSheet(context, size, belDegeri);
                        },
                        child: Container(
                          height: size.height * 0.05,
                          child: Center(
                            child: Text(
                              belDegeri.toString(),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            ),
                            border: Border.all(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      emptyLow(size),
                      Text("Kalça"),
                      emptyLow(size),
                      GestureDetector(
                        onTap: () {
                          myBottomSheet(context, size, kalcaDegeri);
                        },
                        child: Container(
                          height: size.height * 0.05,
                          child: Center(
                            child: Text(
                              kalcaDegeri.toString(),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            ),
                            border: Border.all(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
            emptyLow(size),
          ],
        ),
      ),
    );
  }

  void myBottomSheet(BuildContext context, Size size, double kiloDegeri) {
    showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: size.height * .3,
          width: size.width,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(.5),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50))),
            child: Column(
              children: <Widget>[
                SizedBox(height: 16),
                Text('Kilo Giriniz',
                    style: Theme.of(context).textTheme.headline6),
                DecimalNumberPicker(
                  value: kiloDegeri,
                  minValue: 30,
                  maxValue: 150,
                  decimalPlaces: 2,
                  onChanged: (value) => setState(() => kiloDegeri = value),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget emptyMedium(Size size) {
    return SizedBox(
      height: size.height * 0.025,
    );
  }

  Widget emptyLow(Size size) {
    return SizedBox(
      height: size.height * 0.015,
    );
  }
}
