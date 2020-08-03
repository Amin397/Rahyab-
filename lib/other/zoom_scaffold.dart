import 'package:rahyab/lib/circleList/circle_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rahyab/screens/main_pages/HomePazirandegan.dart';
import 'package:rahyab/screens/main_pages/page2.dart';
import 'package:rahyab/screens/main_pages/page3.dart';
import 'package:rahyab/screens/main_pages/page4.dart';

class ZoomScaffold extends StatefulWidget {
  final Widget menuScreen;
  final Layout contentScreen;

  ZoomScaffold({
    this.menuScreen,
    this.contentScreen,
  });

  @override
  _ZoomScaffoldState createState() => new _ZoomScaffoldState();
}

class _ZoomScaffoldState extends State<ZoomScaffold>
    with TickerProviderStateMixin {
  int currentIndex = 2;
  PageController _pageController;
  ScrollController _scrollController;
  bool isCollapsed = false;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _pageController = PageController(initialPage: 2);

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
  }

//  final List<TitledNavigationBarItem> items = [
//    TitledNavigationBarItem(
//        title: Text('کیف پول'), icon: Icons.account_balance_wallet),
//    TitledNavigationBarItem(
//        title: Text(
//          'خریدبدون کارت',
//          style: TextStyle(
//            fontSize: 11.0
//          ),
//        ),
//        icon: Icons.credit_card),
//    TitledNavigationBarItem(title: Text('صفحه اصلی' , style: TextStyle(
//        fontSize: 12.0
//    ),), icon: Icons.home),
//    TitledNavigationBarItem(title: Text('تخفیف روز' , style: TextStyle(
//        fontSize: 12.0
//    ),), icon: Icons.local_offer),
//    TitledNavigationBarItem(title: Text('صورتحساب' , style: TextStyle(
//        fontSize: 12.0
//    ),), icon: Icons.assignment),
//  ];

  List icons = [
    Icons.shop,
    Icons.timer,
    Icons.tap_and_play,
    Icons.account_box,
    Icons.account_balance_wallet,
    Icons.shopping_cart,
    Icons.wifi_tethering,
  ];

  List pages = [
    HomePazirandegan(),
    Page2(),
    Page3(),
  ];

  List name = [
    'پذیرندگان',
    'پیشنهاد ویژه',
    'خرید بدون کارت',
    'پروفایل',
    'کیف پول',
    'فروشگاه اینترنتی',
    'استارت آپ ها',
  ];

  Curve scaleDownCurve = new Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);

  createContentDisplay(context) {
    var size = MediaQuery.of(context).size;

    return zoomAndSlideContent(new Container(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            Image.asset('assets/images/background.jpg').image)),
                width: size.width,
                height: size.height,
                child: Center(
                  child: Container(
                    child: CircleList(
                      showInitialAnimation: true,
                      animationSetting: AnimationSetting(),
                      centerWidget: (!itemSelected)
                          ? Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        spreadRadius: 1.0,
                                        blurRadius: 5.0)
                                  ],
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image:
                                          Image.asset('assets/images/logo.png')
                                              .image)),
                            )
                          : amin,
//                gradient: LinearGradient(
//                  colors: [
//                    Colors.red,
//                    Colors.blue
//                  ],
//                  begin: Alignment.topCenter,
//                  end: Alignment.bottomCenter,
//                ),
                      innerCircleRotateWithChildren: false,
                      rotateMode: RotateMode.allRotate,
                      origin: Offset(0, 0),
                      children: List.generate(7, (index) {
                        return Items(index, icons[index], name[index]);
                      }),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Text(
                  'باشگاه مشتریان رهیاب',
                  style: TextStyle(
                      fontFamily: 'iranSance',
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  padding: EdgeInsets.only(top: (size.height * .11) * .4),
                  width: size.width,
                  height: size.height * .2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          if (!isCollapsed) {
                            _animationController
                              ..duration = Duration(milliseconds: 1500)
                              ..forward();
                            Provider.of<MenuController>(context, listen: true)
                                .toggle();
                          } else {
                            _animationController
                              ..duration = Duration(milliseconds: 1500)
                              ..reverse();
                            Provider.of<MenuController>(context, listen: true)
                                .toggle();
                          }
                          setState(() {
                            isCollapsed = !isCollapsed;
                          });
                        },
                        child: Container(
                          height: (!isCollapsed) ? 60.0 : 100.0,
                          width: (!isCollapsed) ? 60.0 : 100.0,
                          child: Lottie.asset('assets/anim/arrow.json',
                              controller: _animationController,
                              fit: BoxFit.contain),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(5.0),
                                width: size.width * .15,
                                height: size.height * .2,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          spreadRadius: 1.2,
                                          blurRadius: 5.0)
                                    ],
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2.0),
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: Image.asset(
                                                'assets/images/avatar.png')
                                            .image)),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: size.width * .75,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'مصطفی براتی',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                            fontFamily: 'iranSance'),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'کد عضویت: ',
                                            style: TextStyle(
                                                fontFamily: 'iranSance',
                                                fontSize: 8.0,
                                                color: Colors.white60),
                                          ),
                                          Text(
                                            'ba45124845',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.white,
                                              fontFamily: 'IRANSans',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'موجودی: ',
                                            style: TextStyle(
                                                fontFamily: 'iranSance',
                                                fontSize: 8.0,
                                                color: Colors.white60),
                                          ),
                                          Text(
                                            '500.000',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.white,
                                              fontFamily: 'IRANSans',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        )
//          PageView(
//            controller: _pageController,
//            allowImplicitScrolling: false,
//            onPageChanged: (page){
//              setState(() {
//                currentIndex = page;
//              });
//            },
//            children: <Widget>[
//              VsWallet(),
//              QrCodeScanner(),
//              widget.contentScreen.contentBuilder(context),
//              DayDiscount(),
//              Bills(),
//            ],
//          ),
//          bottomNavigationBar: TitledBottomNavigationBar(
//            onTap: (index) {
//              setState(() {
//                currentIndex = index;
//                print(currentIndex);
//                onTabTapped(index);
//              });
//            },
//            enableShadow: true,
//            reverse: true,
//            currentIndex: currentIndex,
//            curve: Curves.easeInBack,
//            items: items,
//            inactiveStripColor: Color(0xff00a5b8),
//            indicatorColor: Color(0xffff5a47),
//            activeColor: Color(0xffff5a47),
//            inactiveColor: Color(0xff00a5b8),
//          ),
            ),
      ),
    ));
  }

  bool itemSelected = false;

  Widget centerWidget([icon, name, index]) {
    return (!itemSelected)
        ? Container()
        : GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                switch (index) {
                  case 0:
                    {
                      return HomePazirandegan(index);
                    }
                  case 1:
                    {
                      return HomePazirandegan(index);
                    }
                  case 2:
                    {
                      return HomePazirandegan(index);
                    }
                  case 3:
                    {
                      return Page2();
                    }
                  case 4:
                    {
                      return HomePazirandegan(index);
                    }
                  case 5:
                    {
                      return Page3();
                    }
                  case 6:
                    {
                      return Page4();
                    }
                }
                return null;
              })
              );
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black38, blurRadius: 5.0, spreadRadius: 1.0)
              ], color: Colors.white, shape: BoxShape.circle),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    size: 80.0,
                    color: Color(0xffFFA400),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        fontFamily: 'iranSance',
                        fontSize: 18.0,
                        color: Color(0xffFFA400),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )),
            ),
          );
  }

  Widget amin;

  Widget Items(index, icons, name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          itemSelected = true;
          amin = centerWidget(icons, name, index);
        });
//        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => pages));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 60.0,
            width: 60.0,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffFFA400) , width: 1.5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, blurRadius: 5.0, spreadRadius: 1.0)
                  ], color: Colors.white, shape: BoxShape.circle),
              child: Center(
                child: Icon(icons),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuProfilePic(size) {
    return Container(
      height: size.height * .11,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Row(
        children: <Widget>[],
      ),
    );
  }

  void onTabTapped(int index) {
    _pageController.animateToPage(index,
        curve: Curves.slowMiddle, duration: new Duration(milliseconds: 250));
  }

  zoomAndSlideContent(Widget content) {
    var slidePercent, scalePercent;

    switch (Provider.of<MenuController>(context, listen: true).state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        scalePercent = scaleDownCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        scalePercent = scaleUpCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        break;
    }

    final slideAmount = -200.0 * slidePercent;
    final contentScale = 1.0 - (0.2 * scalePercent);
    final cornerRadius =
        16.0 * Provider.of<MenuController>(context, listen: true).percentOpen;

    return new Transform(
      transform: new Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              offset: const Offset(0.0, 5.0),
              blurRadius: 15.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        child: new ClipRRect(
            borderRadius: new BorderRadius.circular(cornerRadius),
            child: content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Scaffold(
            body: widget.menuScreen,
          ),
        ),
        createContentDisplay(context)
      ],
    );
  }
}

class ZoomScaffoldMenuController extends StatefulWidget {
  final ZoomScaffoldBuilder builder;

  ZoomScaffoldMenuController({
    this.builder,
  });

  @override
  ZoomScaffoldMenuControllerState createState() {
    return new ZoomScaffoldMenuControllerState();
  }
}

class ZoomScaffoldMenuControllerState
    extends State<ZoomScaffoldMenuController> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(
        context, Provider.of<MenuController>(context, listen: true));
  }
}

typedef Widget ZoomScaffoldBuilder(
    BuildContext context, MenuController menuController);

class Layout {
  final WidgetBuilder contentBuilder;

  Layout({
    this.contentBuilder,
  });
}

class MenuController extends ChangeNotifier {
  final TickerProvider vsync;
  final AnimationController _animationController;
  MenuState state = MenuState.closed;

  MenuController({
    this.vsync,
  }) : _animationController = new AnimationController(vsync: vsync) {
    _animationController
      ..duration = const Duration(milliseconds: 600)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
        }
        notifyListeners();
      });
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  get percentOpen {
    return _animationController.value;
  }

  open() {
    _animationController.forward();
  }

  close() {
    _animationController.reverse();
  }

  toggle() {
    if (state == MenuState.open) {
      close();
    } else if (state == MenuState.closed) {
      open();
    }
  }
}

enum MenuState {
  closed,
  opening,
  open,
  closing,
}
