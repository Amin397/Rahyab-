import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:load/load.dart';
import 'package:http/http.dart' as http;
import 'package:rahyab/model/vs_wallet.dart';
import 'package:rahyab/other/const.dart';

class VsWallet extends StatefulWidget {
  @override
  _VsWalletState createState() => _VsWalletState();
}

class Wallet {
  String wName;
  String inventory;
  String imagePath;

  Wallet(this.wName, this.inventory , this.imagePath);
}

class _VsWalletState extends State<VsWallet> {
  List<WalletModel> walletList = List<WalletModel>();
  List<WalletModel> walletList2 = List<WalletModel>();
  List showList = List();
  @override
  Widget build(BuildContext context) {

    List<Wallet> wallet = [
      Wallet('نگارینه', '12.000.110' , 'assets/images/negarine.png'),
      Wallet('نگانون', '9.000.110', 'assets/images/neganon_logo.png'),
      Wallet('نگامارکت', '22.000.110', 'assets/images/nega_market.png'),
      Wallet('سامان نگار', '5.000.110', 'assets/images/saman_negar.png'),
      Wallet('نگافود', '10.000.110', 'assets/images/nega_food.png'),
      Wallet('گاوریش', '10.000.110', 'assets/images/neganon_logo.png'),
    ];

    Future<WalletModel> getList() async {
      showLoadingDialog();
      http.Response r = await http
          .post(API_ROOT, body: {'target': 'reqPart', 'typeOfCar_id': '4'});
      if (r.statusCode == 200) {
        Map<String, dynamic> b = jsonDecode(r.body);
        List<WalletModel> listP2 = List<WalletModel>();
        for (var item in b['product']) {
          listP2.add(WalletModel.fromJson(item));
        }

        setState(() {
          walletList.addAll(walletList2);
        });
        hideLoadingDialog();
      }
    }

    void select(catId) {
      setState(() {
        showList.clear();
        for (WalletModel i in walletList) {
          showList.add(i);
        }
      });
    }

    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * .05),
            width: size.width,
            height: size.height * .1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                ' کیف پول مجازی ',
                style: TextStyle(
                  fontFamily: 'iranSance',
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: wallet.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .05,
                        vertical: size.height * .011),
                    child: _buildWalletItems(context, index, wallet, size),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWalletItems(context, index, wallet, size) {
    return Material(
      elevation: 10.0,
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      child: Container(
        height: size.height * .24,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset('assets/images/wallet_patern.jpg').image
            )
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Material(
                elevation: 5.0,
                color: Colors.brown,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
                child: Container(
                  height: (size.height * .24) * .5,
                  width: size.width * .3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset('assets/images/charm.png').image
                      ),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                      color: Colors.black.withAlpha(70)),
                  child: Center(
                    child: Container(
                      height: ((size.height * .24) * .5) * .4,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5.0,
                                spreadRadius: 1.0)
                          ],
                          shape: BoxShape.circle,
                        image: DecorationImage(
                          image: Image.asset(wallet[index].imagePath).image
                        )
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: size.width * .58,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      wallet[index].wName,
                      style: TextStyle(
                        fontFamily: 'iranSance',
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(height: 10.0, color: Colors.black54,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'موجودی: ',
                          style: TextStyle(color: Colors.white, fontSize: 12.0, fontFamily: 'iranSance'),
                        ),
                        Text(
                          wallet[index].inventory,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'iranSance',
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ],
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
}
