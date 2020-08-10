import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rahyab/Helper/NavHelper.dart';
import 'package:rahyab/Helper/RequestHelper.dart';
import 'package:rahyab/model/CastesModel.dart';

import 'item_detailes_click.dart';

class ItemsDetails extends StatefulWidget {
  String categorieText;
  int work_id;

  ItemsDetails(this.categorieText, this.work_id);

  @override
  _ItemsDetailsState createState() => _ItemsDetailsState();
}

class _ItemsDetailsState extends State<ItemsDetails>
    with TickerProviderStateMixin {
  List<CastesModel> list = List();

  init() async {
    await RequestHelper.makeGetSenf(widget.work_id).then((value) => {
          for (var i in value) {list.add(i)}
        });
    setState(() {});
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Color(0xff290d66),
          title: Text(
            widget.categorieText,
            style: TextStyle(fontFamily: 'iranSance', fontSize: 16.0),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .05, vertical: size.height * .01),
          height: size.height,
          width: size.width,
          child: Column(
            children: <Widget>[
              _buildTopBanner(size),
              Expanded(
                flex: 1,
                child: _buildPageView(context, size),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBanner(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * .03),
      height: size.height * .2,
      width: size.width,
      decoration: BoxDecoration(
        color: Color(0xff290d66),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }

  Widget _buildPageView(context, size) {
    return Container(
      child: Center(
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: size.height * .03),
          itemBuilder: (context, index) => _buildItemsOfGridView(index, size),
          itemCount: list.length,
        ),
      ),
    );
  }

  Widget _buildItemsOfGridView(index, size) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            NavHelper.push(
                context,
                ItemDetailsClick(
                    list[index].name, widget.categorieText, list[index].id));
          },
          child: Container(
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(size.width * .02),
            height: size.height * .12,
            width: size.height * .12,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, blurRadius: 7.0, spreadRadius: .8)
              ],
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                list[index].name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 11.0,
                    fontFamily: 'iranSance',
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
