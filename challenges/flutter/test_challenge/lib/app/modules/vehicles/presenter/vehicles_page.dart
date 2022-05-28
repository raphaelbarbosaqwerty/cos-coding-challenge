import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:test_challenge/app/core/domain/entities/vehicle.dart';
import 'package:test_challenge/app/core/utils/inspection_list.dart';
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
                "Vehicle Inspections",
                style: textTheme.headline6,
              ),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: inspectionList.length,
                itemBuilder: (context, index) {
                  final inspection = inspectionList[index];
                  return InkWell(
                    onTap: () {
                      Modular.to.pushNamed(
                        '/vehicles/',
                        arguments: inspection,
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
                                  child: Text('DATE'),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
