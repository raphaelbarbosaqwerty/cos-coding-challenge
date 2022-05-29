import 'package:flutter/material.dart';

class DashboardVehicleCell extends StatelessWidget {
  const DashboardVehicleCell({
    Key? key,
    required this.img,
    required this.name,
  }) : super(key: key);

  final String name;
  final String img;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.5,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  img,
                  height: 64.0,
                  width: 64.0,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                name,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
