import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_challenge/app/core/utils/inspection_list.dart';
import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';
import 'package:test_challenge/app/modules/vehicles/presenter/vehicles_store.dart';

class InspectionPage extends StatefulWidget {
  final String title;
  final Inspection inspection;
  const InspectionPage({
    Key? key,
    this.title = 'Inspection',
    required this.inspection,
  }) : super(key: key);
  @override
  InspectionPageState createState() => InspectionPageState();
}

class InspectionPageState extends State<InspectionPage> {
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
                "Inspection #DATE",
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
                      // Modular.to.pushNamed(
                      //   '/vehicles/',
                      //   arguments: inspection,
                      // );
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
