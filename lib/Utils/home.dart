import 'dart:convert';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:gwcl_app/entities/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    refreshState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        key: refreshkey,
        onRefresh: refreshState,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    padding: EdgeInsets.all(20),
                    // height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0XFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0XFFEEEEEE),
                              blurRadius: 10,
                              offset: Offset(0, 0.4))
                        ]),
                    margin: EdgeInsets.all(20),
                    child: Column(children: [
                      Row(children: [
                        Expanded(
                            child: Container(
                                child: Image.asset(
                          'assets/images/tip.png',
                        ))),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Text('Water Saving Tips'),
                                SizedBox(height: 20),
                                Row(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        // perform action to login
                                        Navigator.pushNamed(context, '/tips');
                                      },
                                      child: Container(
                                        height: 35,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.black,
                                        ),
                                        width: 100,
                                        child: Center(
                                          child: Text(
                                            'View',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    padding: EdgeInsets.all(20),
                    // height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0XFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0XFFEEEEEE),
                              blurRadius: 10,
                              offset: Offset(0, 0.4))
                        ]),
                    margin: EdgeInsets.all(20),
                    child: Column(children: [
                      Row(children: [
                        Expanded(
                            child: Container(
                                child: Image.asset(
                          'assets/images/pay.png',
                        ))),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Text('Pay Water Bill Online'),
                                SizedBox(height: 20),
                                Row(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        // perform action to login
                                        Navigator.pushNamed(context, '/tips');
                                      },
                                      child: Container(
                                        height: 35,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.black,
                                        ),
                                        width: 100,
                                        child: Center(
                                          child: Text(
                                            'Pay',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    padding: EdgeInsets.all(20),
                    // height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0XFFFFFFFF),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0XFFEEEEEE),
                              blurRadius: 10,
                              offset: Offset(0, 0.4))
                        ]),
                    margin: EdgeInsets.all(20),
                    child: Column(children: [
                      Row(children: [
                        Expanded(
                            child: Container(
                                child: Image.asset(
                          'assets/images/mess.png',
                        ))),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Text('Contact Us'),
                                SizedBox(height: 20),
                                Row(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        // perform action to login
                                        Navigator.pushNamed(context, '/tips');
                                      },
                                      child: Container(
                                        height: 35,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.black,
                                        ),
                                        width: 100,
                                        child: Center(
                                          child: Text(
                                            'Message',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ])),
              ),
            ],
          ),
        ));
  }

  var msg = '';
  var state = '';

  Future<void> _onLoading() async {
    // actively listen for status updates
    var listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: Color.fromRGBO(255, 255, 255, 0),
                //  child:Loader(),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new CircularProgressIndicator(),
                    // new Text("Loading"),
                    // Loader(),
                  ],
                ),
              );
            },
          );
          new Future.delayed(new Duration(seconds: 3), () {
            Navigator.pop(context); //pop dialog
          });

          break;
        case DataConnectionStatus.disconnected:
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: Color.fromRGBO(128, 128, 128, 0),
                //  child:Loader(),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new CircularProgressIndicator(),
                    // new Text("Loading"),
                    // Loader(),
                  ],
                ),
              );
            },
          );
          new Future.delayed(new Duration(seconds: 3), () {
            Navigator.pop(context); //pop dialog
            String msg =
                'Sorry, no internet connection. Please try again later';
            errorAlert(msg);
          });
          // print('Data connection is not available.');
          break;
      }
    });

    // close listener after 30 seconds, so the program doesn't run forever
    await Future.delayed(Duration(seconds: 2));
    await listener.cancel();
  }

  errorAlert(msg) {
    var alertStyle = AlertStyle(
      // overlayColor: Colors.grey,
      animationType: AnimationType.fromLeft,
      isCloseButton: false,
      isOverlayTapDismiss: true,
      descStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
      animationDuration: Duration(milliseconds: 200),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.white,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
    );

    Alert(
      context: context,
      style: alertStyle,
      // type: AlertType.error,
      image: Image.asset(
        'assets/images/cancel.png',
        width: 130,
      ),
      title: "Ooops!",
      desc: msg,
      buttons: [
        DialogButton(
          child: Text(
            "Try again",
            style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.red,
          radius: BorderRadius.circular(20.0),
          // width: 500,
        ),
      ],
    ).show();
  }

  successAlert(msg) {
    var alertStyle = AlertStyle(
      // overlayColor: Colors.grey,
      animationType: AnimationType.fromLeft,
      isCloseButton: false,
      isOverlayTapDismiss: true,
      descStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
      animationDuration: Duration(milliseconds: 200),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.white,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.black,
      ),
    );

    Alert(
      context: context,
      style: alertStyle,
      // type: AlertType.error,
      image: Image.asset(
        'assets/images/confirm.png',
        width: 130,
      ),
      title: "Great!",
      desc: msg,
      buttons: [
        DialogButton(
          child: Text(
            "Success",
            style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
          ),
          onPressed: () {
            Navigator.pop(context);
            //  clearTextInput();
          },
          color: Colors.black,
          radius: BorderRadius.circular(20.0),
          // width: 500,
        ),
      ],
    ).show();
  }

  var refreshkey = GlobalKey<RefreshIndicatorState>();
  Future<void> refreshState() async {
    refreshkey.currentState?.show(atTop: true);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      globals.userAccAmt = globals.userAccAmt;
    });
  }
}
