import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:test_challenge/app/core/utils/dashboard_list.dart';
import 'package:test_challenge/app/core/utils/vehicle_list.dart';
import 'package:test_challenge/app/modules/dashboard/presenter/dashboard_store.dart';
import 'package:test_challenge/app/modules/dashboard/presenter/states/dashboard_state.dart';
import 'package:test_challenge/app/modules/dashboard/presenter/widgets/dashboard_vehicle_cell.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key? key, this.title = 'Dashboard'}) : super(key: key);
  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  final DashboardStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.getListVehicles();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              "Cars",
              style: textTheme.headline6,
            ),
            const Divider(),
            ValueListenableBuilder(
              valueListenable: store,
              builder: (context, value, _) {
                if (value is LoadingDashboardState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (value is ErrorDashboardState) {
                  return Text(value.error);
                }

                if (value is LoadedDashboardState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.vehicles.length,
                    itemBuilder: (context, index) {
                      final vehicle = value.vehicles[index];
                      return InkWell(
                        onTap: () {
                          Modular.to.pushNamed(
                            '/vehicles/',
                            arguments: vehicle,
                          );
                        },
                        child: DashboardVehicleCell(
                          img: vehicle.img,
                          name: vehicle.name,
                        ),
                      );
                    },
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
