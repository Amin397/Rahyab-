import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rahyab/screens/map_provider/pdovider_map.dart';

class MainDetailScreen extends StatefulWidget {
  String name;
  String imagePath;
  String description;

  MainDetailScreen(this.name, this.imagePath, this.description);

  @override
  _MainDetailScreenState createState() => _MainDetailScreenState();
}

class _MainDetailScreenState extends State<MainDetailScreen> {

  double offset = 150.0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff290d66),
          title: Text(widget.name),
        ),
        body: Container(

          color: Colors.grey[200],
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildContainer(size),
              _buildImageDescription(size),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .1),
                child: Divider(),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .03),
                child: Text(
                  'توضیحات',
                  style: TextStyle(color: Colors.black54, fontSize: 12.0),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: size.width * .05, top: 5.0 , left: size.width * .05),
                child: Text(
                  widget.description,
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * .03),
                child: _buildLocationContainer(size),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationContainer(Size size) {
    return  GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          offset = offset + ( - (details.delta.dx));
          print(offset);
          if(offset >= size.width){
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.upToDown, child: ProviderMap()));
          }
        });
      },
      child: Container(
        height: size.height * .08,
        width: offset,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black , width: .1),
          boxShadow: [
            BoxShadow(color: Colors.black26, spreadRadius: 0.8, blurRadius: 5.0)
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
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
                        bottomLeft: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0)),
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
                        bottomLeft: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0)),
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
                    Text('موقعیت' , style: TextStyle(
                        color: Colors.white ,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        fontFamily: 'iranSance'
                    ),),
                    Icon(Icons.keyboard_arrow_left , color: Colors.white,size: 30.0,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLocationDragTarget(Size size){
    return Container(
      height: size.height * .08,
      width: size.width * .4,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black , width: .1),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
      ),
      child: DragTarget(
        onAccept: (data){
          print(data);
        },
        builder: (context , List<int> candidateData , rejectData){
          return Center(
            child: Text('amin'),
          );
        },
        onWillAccept: (data){
          if(data == 'location'){
            return true;
          }else{
            return false;
          }
        },
      ),
    );
  }

  void _onHorizontalDrag(DragEndDetails details) {
    if(details.primaryVelocity == 0) return; // user have just tapped on screen (no dragging)

    if (details.primaryVelocity.compareTo(0) == -1)
      print('dragged from left');
    else
      print('dragged from right');
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
                widget.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                ' ${widget.name}',
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
}
