import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rahyab/screens/main_pages/page_view/bedone_card_screen.dart';
import 'package:rahyab/screens/main_pages/page_view/pazirandegan_screen.dart';
import 'package:rahyab/screens/main_pages/page_view/pishnehad_vizhe_screen.dart';
import 'package:rahyab/screens/main_pages/page_view/vs_wallet_screen.dart';

class HomePazirandegan extends StatefulWidget {

  int index_screen;
  HomePazirandegan([this.index_screen]);

  @override
  _HomePazirandeganState createState() => _HomePazirandeganState();
}

class _HomePazirandeganState extends State<HomePazirandegan>
with TickerProviderStateMixin{

  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;
  PageController _pageController;

  final iconList = <IconData>[
    Icons.shop,
    Icons.timer,
    Icons.tap_and_play,
    Icons.account_balance_wallet,
  ];

  @override
  void initState() {
    super.initState();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Color(0xff290d66),
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
          () => _animationController.forward(),
    );

    _pageController = PageController(initialPage: widget.index_screen);
  }

  void onTabTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        body: PageView(
          controller: _pageController,
          onPageChanged: (page){
            setState(() {
              widget.index_screen = page;
            });
          },
          children: <Widget>[
            Pazirandegan(),
            PishnehadVizhe(),
            KharidBedoneCard(),
            VsWallet()
          ],
        ),
        floatingActionButton: ScaleTransition(
          scale: animation,
          child: FloatingActionButton(
            elevation: 8,
            backgroundColor: Colors.yellow.shade700,
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
//              _animationController.reset();
//              _animationController.forward();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          backgroundColor: Color(0xff290d66),
          activeIndex: widget.index_screen,
          activeColor: Colors.yellow.shade700,
          splashColor: Colors.white,
          inactiveColor: Colors.white,
          notchAndCornersAnimation: animation,
          splashSpeedInMilliseconds: 350,
          notchSmoothness: NotchSmoothness.softEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) {
            setState(() {
              widget.index_screen = index;
              onTabTapped(index);
              print(index);
            });
          },
        ),
      )
    );
  }
}

//class NavigationScreen extends StatefulWidget {
//  final IconData iconData;
//  int index;
//
//  NavigationScreen(this.iconData , this.index) : super();
//
//  @override
//  _NavigationScreenState createState() => _NavigationScreenState();
//}
//
//class _NavigationScreenState extends State<NavigationScreen> with TickerProviderStateMixin {
//  AnimationController _controller;
//  Animation<double> animation;
//  PageController _pageController;
//
//  @override
//  void didUpdateWidget(NavigationScreen oldWidget) {
//    super.didUpdateWidget(oldWidget);
//    if (oldWidget.iconData != widget.iconData) {
//    }
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    _pageController = PageController(initialPage: 0);
//  }
//
//  @override
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      width: double.infinity,
//      height: double.infinity,
//      color: Colors.white,
//      child: ,
//    );
//  }
//}
