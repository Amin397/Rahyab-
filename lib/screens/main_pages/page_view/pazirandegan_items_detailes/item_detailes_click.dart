import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rahyab/Helper/NavHelper.dart';
import 'package:rahyab/Helper/RequestHelper.dart';
import 'package:rahyab/model/ProviderModel.dart';

import 'main_details_screen.dart';

class ItemDetailsClick extends StatefulWidget {
  String parentName;
  String castsName;
  int castId;

  ItemDetailsClick(this.castsName, this.parentName , this.castId);

  @override
  _ItemDetailsClickState createState() => _ItemDetailsClickState();
}

class _ItemDetailsClickState extends State<ItemDetailsClick> {
  ScrollController _scrollController;

  List<ProviderModel> list = List();

  init() async {
    await RequestHelper.makeGetProvider(widget.castId).then((value) => {
      for(var i in value){
        list.add(i)
      }
    });
    print(list.length);
    setState(() {

    });

  }

  @override
  void initState() {
    init();
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Color(0xff290d66),
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    var size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: _buildAppBar(),
        body: _buildBodyOfScaffold(size),
      ),
    );
  }

  Widget _buildBodyOfScaffold(Size size){
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .05, vertical: size.height * .01),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: size.height * .03),
            height: size.height * .2,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Color(0xff290d66)),
          ),
          Expanded(
            child: Container(
              width: size.width,
              padding: EdgeInsets.symmetric(vertical: size.height * .01),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                controller: _scrollController,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: size.width * .05,
                        right: size.width * .05,
                        bottom: size.height * .03),
                    child: InkWell(
                      onTap: () {
                        NavHelper.push(context, MainDetailScreen(list[index].name , 'assets/images/coffee_logo.png' , list[index].desc));
                      },
                      child: _buildListViewIcons(context, index),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAppBar(){
    return AppBar(
      backgroundColor: Color(0xff290d66),
      title: Text(
        '${widget.parentName} / ${widget.castsName}',
        style: TextStyle(fontSize: 14.0, fontFamily: 'IRANSans'),
      ),
    );
  }

  Widget _buildListViewIcons(context, index) {

    var size = MediaQuery.of(context).size;

    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0)),
      child: Container(
        height: size.height * .15,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0))),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      ' ${list[index].name}',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    Divider(),
                    Text(
                      (list[index].desc.length < 2) ? text : list[index].desc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  String text = 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.';
}
