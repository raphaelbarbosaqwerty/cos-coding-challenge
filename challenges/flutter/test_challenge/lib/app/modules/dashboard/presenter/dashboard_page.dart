import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:test_challenge/app/core/utils/dashboard_list.dart';
import 'package:test_challenge/app/core/utils/vehicle_list.dart';
import 'package:test_challenge/app/modules/dashboard/presenter/dashboard_store.dart';

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
            ListView.builder(
              shrinkWrap: true,
              itemCount: dashboardList.length,
              itemBuilder: (context, index) {
                final item = dashboardList[index];
                return ListTile(
                  leading: Icon(
                    item.iconData,
                    color: Colors.black,
                  ),
                  title: Text(item.name),
                  onTap: () {
                    Navigator.pop(context);
                    if (item.route != null) {
                      Modular.to.pushNamed(item.route ?? "/");
                    }
                  },
                );
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
      // TODO - Cars list
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView.builder(
          itemCount: vehicleList.length,
          itemBuilder: (context, index) {
            final vehicle = vehicleList[index];
            return InkWell(
              onTap: () {
                Modular.to.pushNamed(
                  '/vehicles/',
                  arguments: vehicle,
                );
              },
              child: AspectRatio(
                aspectRatio: 3.5,
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 64,
                          width: 64,
                          child: CircleAvatar(
                            child: Text('IMG Car'),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(vehicle.name),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
