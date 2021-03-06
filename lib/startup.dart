import 'package:flora_ai/gallery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flora_ai/home.dart';
import 'package:flora_ai/export.dart';

import 'history/cropfeed.dart';

class StartupPage extends StatefulWidget {
  @override
  static final String routeName = "/startup";
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  
  final List<Tab> tab = <Tab>[
    Tab(
      text: 'H I S T O R Y',
    ),
    Tab(
      text: 'C L I C K',
    ),
    Tab(
      text: 'E X P O R T',
    ),
  ];



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;
    return Scaffold(
      appBar: _getAppBar(),
      body: SizedBox(
          height: screenHeight,
          child: DefaultTabController(
            length: tab.length,
            initialIndex: 1,
            child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(screenHeight / 10),
                  child: new SafeArea(
                      child: Container(
                    // color: Theme.of(context).primaryColor,
                    child: Column(
                      children: <Widget>[
                        new TabBar(
                            tabs: tab,
                            unselectedLabelColor:
                                Theme.of(context).primaryColor,
                            dragStartBehavior: DragStartBehavior.down,
                            labelPadding: EdgeInsets.symmetric(vertical: 5),
                            labelColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: new BubbleTabIndicator(
                              indicatorHeight: 25.0,
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              indicatorColor: Theme.of(context).accentColor,
                              tabBarIndicatorSize: TabBarIndicatorSize.tab,
                            ))
                      ],
                    ),
                  )),
                ),
                // appBar: AppBar(bottom: TabBar(tabs:tab,),title: Text('flora test',style:TextStyle(color:Colors.black)),),
                body: TabBarView(
                  children: [
                    _getHistory(context),
                    // Icon(Icons.directions_car,color:Colors.black),
                    _getClick(context),
                    _getExport(context),
                  ],
                )),
          )),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Row(children: [
        Image.asset('images/app icon.png'),
        Padding(padding: EdgeInsets.only(right: 10)),
        Text('flora',
            style: TextStyle(
                fontFamily: 'Less Sans',
                fontSize: 20,
                color: Theme.of(context).accentColor)),
        Text('.ai',
            style: TextStyle(
                fontFamily: 'Less Sans',
                fontSize: 20,
                color: Color(0xFFD3CEBA)))
      ]),
    );
  }

  // _getAlertBox(BuildContext context) {
  //   // flutter defined function
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       // return object of type Dialog
  //       return AlertDialog(
  //         title: new Text("Alert Dialog title"),
  //         content: new Text("Alert Dialog body"),
  //         actions: <Widget>[
  //           // usually buttons at the bottom of the dialog
  //           new FlatButton(
  //             child: new Text("OK"),
  //             onPressed: () {
  //               setState(() {
  //                 startup = false;
  //               });
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Container _getHistory(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;
    Widget history = new Container(
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.bottomCenter,
      //         end: Alignment.topCenter,
      //         colors: [Color(0xFFEEE7CD), Colors.white])),
      height: 350,
      width: screenWidth,
      // color: Theme.of(context).accentColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // SizedBox(
          //   height: 10,
          // ),
          Container(child: CropFeed()),
          // Padding(
          //   padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          //   child: Text("hello",
          //       textAlign: TextAlign.justify,
          //       style: TextStyle(color: Colors.black, fontSize: 14)),
          // ),
        ],
      ),
    );
    return history;
  }

  Container _getClick(BuildContext context) {
    Widget click = Container(
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.bottomCenter,
      //         end: Alignment.topCenter,
      //         colors: [Color(0xFFEEE7CD), Colors.white])),
      child: PickImageDemo(),
    );
    return click;
  }

  Container _getExport(BuildContext context) {
    Widget click = Container(
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.bottomCenter,
      //         end: Alignment.topCenter,
      //         colors: [Color(0xFFEEE7CD), Colors.white])),
      child: ExportPage(),
    );
    return click;
  }
}
