import 'package:flutter/material.dart';
import 'package:gwcl_app/Utils/drawer.dart';
import 'package:gwcl_app/Utils/home.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int index = 0;
  List<Widget> list = [
    Home(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0XFF242B5C),
        elevation: 0,
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      body: list[index],
      drawer: MyDrawer(onTap: (ctx, i) {
        setState(() {
          index = i;
          Navigator.pop(ctx);
        });
      }),
    );
  }
}
