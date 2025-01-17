import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_challenge/app/core/presenter/cell_generic/cell_generic_widget.dart';
import 'package:test_challenge/app/core/presenter/custom_drawer/custom_drawer_widget.dart';
import 'package:test_challenge/app/modules/dashboard/presenter/dashboard_store.dart';
import 'package:test_challenge/app/modules/dashboard/presenter/states/dashboard_state.dart';

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
      drawer: CustomDrawerWidget(
        onTapLogout: () async {
          final response = await store.logout();
          if (response) {
            Modular.to.navigate('/');
          } else {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error!'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
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
                            '/dashboard/vehicles/',
                            arguments: vehicle,
                          );
                        },
                        child: CellGenericWidget(
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
