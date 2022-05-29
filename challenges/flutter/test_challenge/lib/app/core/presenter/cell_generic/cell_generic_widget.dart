import 'package:flutter/material.dart';

class CellGenericWidget extends StatelessWidget {
  const CellGenericWidget({
    Key? key,
    this.img = "",
    required this.name,
    this.hasImg = true,
  }) : super(key: key);

  final String name;
  final bool hasImg;
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
              Visibility(
                visible: hasImg,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.network(
                    img,
                    height: 64.0,
                    width: 64.0,
                  ),
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
