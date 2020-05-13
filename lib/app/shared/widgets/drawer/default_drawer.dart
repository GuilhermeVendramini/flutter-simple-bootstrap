import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_bootstrap/app/core/core_controller.dart';

class DefaultDrawer extends StatefulWidget {
  @override
  _DefaultDrawerState createState() => _DefaultDrawerState();
}

class _DefaultDrawerState extends State<DefaultDrawer> {
  CoreController _coreController;

  _logoutUser() async {
    await _coreController.logoutCurrentUser();
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    _coreController = Provider.of<CoreController>(context);
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Flutter Bootstrap'),
                SizedBox(
                  height: 10.0,
                ),
                _coreController.currentUser.name != null
                    ? Text('Hi, ${_coreController.currentUser.name}')
                    : Container(),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: _logoutUser,
          ),
        ],
      ),
    );
  }
}
