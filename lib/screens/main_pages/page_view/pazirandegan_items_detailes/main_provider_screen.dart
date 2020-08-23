import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rahyab/Helper/AlertHelper.dart';
import 'package:rahyab/Helper/NavHelper.dart';
import 'package:rahyab/model/ProviderModel.dart';
import 'package:rahyab/model/qr_model.dart';
import 'package:rahyab/screens/map_provider/pdovider_map.dart';

class MainDetailScreen extends StatefulWidget {
  ProviderModel providerModel;

  MainDetailScreen(this.providerModel);

  @override
  _MainDetailScreenState createState() => _MainDetailScreenState();
}

class _MainDetailScreenState extends State<MainDetailScreen>
    with TickerProviderStateMixin {
  double offset = 150.0;
  double radius = 40;

  AnimationController _animationController;

  var cartPriceMask = new MaskTextInputFormatter(
      mask: '###,###,###,###', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff290d66),
          title: Text(widget.providerModel.name),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildContainer(size),
              _buildImageDescription(size),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * .05,
                    right: size.width * .05,
                    top: size.height * .01),
                child: _buildKharid(size),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .1),
                child: Divider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                child: Text(
                  'توضیحات',
                  style: TextStyle(color: Colors.black54, fontSize: 12.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: size.width * .05, top: 5.0, left: size.width * .05),
                child: Text(
                  widget.providerModel.desc,
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: _buildProviderInfo(size),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * .03, bottom: size.height * .02),
                child: _buildLocationContainer(size),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProviderInfo(Size size) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.0),
        topRight: Radius.circular(12.0),
        bottomRight: Radius.circular(10.0),
        bottomLeft: Radius.circular(10.0),
      ),
      child: Container(
        width: size.width,
        height: size.height * .4,
        decoration: BoxDecoration(
            color: Color(0xff290d66),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
              bottomRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            )),
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.bottomCenter,
                child: _buildProviderInfoDetails(size))
          ],
        ),
      ),
    );
  }

  Widget _buildProviderInfoDetails(Size size) {
    return Container(
      padding: EdgeInsets.all(15.0),
      width: size.width,
      height: (size.height * .4) * .97,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'مشخصات مدیریت',
            style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'iranSance',
                fontWeight: FontWeight.w600),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'نام و نام خانوادگی',
                style: TextStyle(color: Colors.black, fontFamily: 'iranSance', fontSize: 12.0),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  height: .3,
                  color: Colors.blueGrey,
                ),
              ),
              Text((widget.providerModel.fname == null &&
                      widget.providerModel.lname == null)
                  ? 'بدون اطلاعات'
                  : '${widget.providerModel.fname} ${widget.providerModel.lname}' , style: TextStyle(
                color: Colors.blueGrey , fontFamily: 'iranSance',
              ),),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'آدرس',
                style: TextStyle(color: Colors.black, fontFamily: 'iranSance', fontSize: 12.0),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  height: .3,
                  color: Colors.blueGrey,
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Text(
                  'بدون اطلاعات'
                  , style: TextStyle(
                  color: Colors.blueGrey , fontFamily: 'iranSance',
                ),),
              )
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'شماره موبایل',
                style: TextStyle(color: Colors.black, fontFamily: 'iranSance', fontSize: 12.0),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  height: .3,
                  color: Colors.blueGrey,
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Text((widget.providerModel.mobile == null)
                    ? 'بدون اطلاعات'
                    : '${widget.providerModel.mobile}' , style: TextStyle(
                  color: Colors.blueGrey , fontFamily: 'iranSance',
                ),),
              )
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'شماره تلفن',
                style: TextStyle(color: Colors.black, fontFamily: 'iranSance', fontSize: 12.0),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  height: .3,
                  color: Colors.blueGrey,
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Text((widget.providerModel.tel == null)
                    ? 'بدون اطلاعات'
                    : '${widget.providerModel.tel}' , style: TextStyle(
                  color: Colors.blueGrey , fontFamily: 'iranSance',
                ),),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKharid(Size size) {
    return GestureDetector(
      onTap: () {
        AlertHelper.kharidProviderDialog(
            context, size, 'assets/images/coffee_logo.png', cartPriceMask);
      },
      child: Container(
        width: size.width,
        height: size.height * .1,
        decoration: BoxDecoration(
            color: Color(0xff290d66),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38, blurRadius: 5.0, spreadRadius: 1.0)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Lottie.asset('assets/anim/shopping.json',
                controller: _animationController, repeat: true),
            Text(
              'خرید از ${widget.providerModel.name}',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'iranSance',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Lottie.asset('assets/anim/shopping.json',
                controller: _animationController, repeat: true)
          ],
        ),
      ),
    );
  }

  Widget _buildLocationContainer(Size size) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          offset = offset + (-(details.delta.dx));
          radius = radius + ((details.delta.dx) / 5);
          if (offset < 150.0) {
            setState(() {
              offset = 150.0;
            });
          }
          print(offset);
          if (offset >= size.width) {
            NavHelper.push(context, ProviderMap());
            Future.delayed(
                new Duration(milliseconds: 500),
                () => {
                      setState(() {
                        offset = 150.0;
                        radius = 40;
                      })
                    });
          }
        });
      },
      child: Container(
        height: size.height * .08,
        width: offset,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: .1),
          boxShadow: [
            BoxShadow(color: Colors.black26, spreadRadius: 0.8, blurRadius: 5.0)
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radius),
              topLeft: Radius.circular(radius)),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                height: size.height * .08,
                width: offset,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        topLeft: Radius.circular(radius)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/map.jpg',
                      ).image,
                    )),
              ),
            ),
            Center(
              child: Container(
                height: size.height * .08,
                width: offset,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        topLeft: Radius.circular(radius)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black45,
                          Colors.black26,
                          Colors.black12
                        ])),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'موقعیت',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                          fontFamily: 'iranSance'),
                    ),
                    Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 30.0,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImageDescription(size) {
    return Container(
      height: size.height * .15,
      width: size.width,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            width: size.width * .27,
            height: size.height,
            child: Center(
              child: Image.asset(
                'assets/images/coffee_logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                ' ${widget.providerModel.name}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContainer(size) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .03, vertical: size.height * .015),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          width: size.width,
          height: size.height * .25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.orangeAccent,
          ),
          child: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(size.width * .03),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      child: Container(
                        height: (size.height * .2) * .4,
                        width: size.width * .15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          color: Color(0xff290d66),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '%25',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0),
                            ),
                            Text(
                              'تخفیف',
                              style: TextStyle(
                                color: Colors.white,
                                height: 1,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: (size.height * .25) * .5,
                  child: Image.asset(
                    'assets/images/cup_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String text =
      'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.';
}
