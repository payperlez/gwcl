import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gwcl_app/entities/globals.dart' as globals;
import 'package:rflutter_alert/rflutter_alert.dart';

class MyDrawer extends StatelessWidget {
  final Function onTap;
  MyDrawer({this.onTap});

  @override
  Widget build(BuildContext context) {
    logout() {
      var alertStyle = AlertStyle(
        // overlayColor: Colors.grey,
        animationType: AnimationType.fromLeft,
        isCloseButton: false,
        isOverlayTapDismiss: true,
        descStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
        animationDuration: Duration(milliseconds: 500),
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
          'assets/images/tip.png',
          width: 150,
        ),
        title: "Ooops!",
        desc: 'You just clicked on the Logout',
        buttons: [
          DialogButton(
            child: Text(
              "Log me out",
              style: TextStyle(color: Color(0XFFFFFFFF), fontSize: 14),
            ),
            onPressed: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
            color: Color(0XFF242B5C),
            radius: BorderRadius.circular(20.0),
          ),
        ],
      ).show();
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0XFF242B5C)),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        width: 60,
                        height: 60,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/user.png'),
                        )),
                    SizedBox(height: 10),
                    Text(
                      'Hello there! ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFFFFFFFF),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFFFE60A),
                      ),
                    ),
                  ]),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => onTap(context, 0),
          ),
          Divider(
            height: 1,
            color: Colors.grey[300],
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              logout();
            },
          ),
          Divider(
            height: 1,
            color: Colors.grey[300],
          ),
        ],
      )),
    );
  }
}
