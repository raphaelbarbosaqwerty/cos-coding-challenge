import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_challenge/app/modules/dashboard/dashboard_store.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key? key, this.title = 'Dashboard'}) : super(key: key);
  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  final DashboardStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // TODO - Load user image
                  SizedBox(
                    height: 64,
                    width: 64,
                    child: CircleAvatar(
                      child: Text("IMG"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // TODO - Dynamic name
                  Text('User name here'),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                // TODO - Move to profile
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.car_rental,
                color: Colors.black,
              ),
              title: const Text('Vehicles'),
              onTap: () {
                Navigator.pop(context);
                // TODO - Move to vehicles
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                // TODO - Do the logout
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
