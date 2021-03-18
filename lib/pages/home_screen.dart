import 'package:boy_kilo_endeksi/pages/gecmis_screen.dart';
import 'package:boy_kilo_endeksi/pages/grafik_screen.dart';
import 'package:boy_kilo_endeksi/pages/panel_screen.dart';
import 'package:boy_kilo_endeksi/pages/yeni_kilo_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: MyPageView(),
      bottomNavigationBar: MyBottomNavigationBar(context),
    );
  }

  Theme MyBottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
        canvasColor: Colors.grey,
        // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        primaryColor: Colors.red,
      ),
      // ,
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {
          pageController.jumpToPage(value);
        },
        items: [
          BottomNavigationBarItem(
            label: "Panel",
            icon: Icon(
              Icons.home_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "Yeni Kilo",
            icon: Icon(
              Icons.add,
            ),
          ),
          BottomNavigationBarItem(
            label: "Geçmiş",
            icon: Icon(
              Icons.history_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "Grafik",
            icon: Icon(
              Icons.paste_outlined,
            ),
          ),
        ],
      ),
    );
  }



  PageView MyPageView() {
    return PageView(
      controller: pageController,
      physics: ScrollPhysics(),
      children: [
        PanelScreen(),
        YeniKiloScreen(),
        GecmisScreen(),
        GrafikScreen()
      ],
      onPageChanged: (value) {
        setState(() {
          selectedIndex = value;
        });
        print(selectedIndex);
      },
    );
  }

  AppBar MyAppBar() {
    return AppBar(
      title: GestureDetector(
        onTap: () {},
        child: Text(
          "Kilo Takibi",
          style: GoogleFonts.cherrySwash(),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            print('Tiklandi');
          },
          child: Icon(
            Icons.settings,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            print("Tiklandi");
          },
          child: Icon(
            Icons.account_circle_outlined,
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
