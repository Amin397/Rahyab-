import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rahyab/other/zoom_scaffold.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'menu_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MenuController menuController;
  PageController pageController;

  final _currentPageNotifier = ValueNotifier<int>(0);
  List<String> texts = [
    'تفریح و سرگرمی',
    'پوشاک',
    'هایپرمارکت',
    'رستوران',
    'کافه',
    'ورزشی',
    'مذهبی',
    'خرید',
    'شهر بازی',
  ];

  List<Icon> icons = <Icon>[
    Icon(
      Icons.videogame_asset,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.highlight,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.forward,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.zoom_out_map,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.zoom_out,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.dashboard,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.assignment,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.account_balance,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
    Icon(
      Icons.list,
      color: Color(0xff00a5b8),
      size: 35.0,
    ),
  ];

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));

    pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
//    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: ChangeNotifierProvider(
        builder: (context) => menuController,
        child: ZoomScaffold(
          menuScreen: MenuScreen(),
          contentScreen: Layout(
              contentBuilder: (cc) => Container(
                    color: Colors.grey[200],
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .03,
                        vertical: size.height * .005),
                    child: Container(
                      color: Colors.red,
                    ),
                  )),
        ),
      ),
    );
  }
}
