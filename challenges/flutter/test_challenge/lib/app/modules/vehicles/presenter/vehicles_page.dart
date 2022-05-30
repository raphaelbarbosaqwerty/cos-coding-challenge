import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:test_challenge/app/core/domain/entities/vehicle.dart';
import 'package:test_challenge/app/core/presenter/cell_generic/cell_generic_widget.dart';
import 'package:test_challenge/app/modules/vehicles/presenter/states/vehicles_states.dart';
import 'package:test_challenge/app/modules/vehicles/presenter/vehicles_store.dart';

class VehiclesPage extends StatefulWidget {
  final String title;
  final Vehicle vehicle;
  const VehiclesPage({
    Key? key,
    this.title = 'Vehicle Inspection',
    required this.vehicle,
  }) : super(key: key);
  @override
  VehiclesPageState createState() => VehiclesPageState();
}

class VehiclesPageState extends State<VehiclesPage> {
  final VehiclesStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.getVehicles(widget.vehicle.id);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Inspections: ${widget.vehicle.name}",
                style: textTheme.headline6,
              ),
              const Divider(),
              ValueListenableBuilder(
                valueListenable: store,
                builder: (context, value, _) {
                  if (value is LoadingVehiclesState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (value is ErrorVehiclesState) {
                    return Text(value.error);
                  }

                  if (value is LoadedVehiclesState) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.inspections.length,
                      itemBuilder: (context, index) {
                        final inspection = value.inspections[index];
                        return InkWell(
                          onTap: () {
                            Modular.to.pushNamed(
                              '/dashboard/vehicles/inspections',
                              arguments: inspection,
                            );
                          },
                          child: CellGenericWidget(
                            hasImg: false,
                            name:
                                "Inspection date: ${inspection.dateFormatted}",
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/dashboard/vehicles/inspections');
        },
        child: const Icon(
          Icons.add_comment,
        ),
      ),
    );
  }
}
