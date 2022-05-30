import 'package:flutter/material.dart';

class PhotoDialogWidget extends StatelessWidget {
  PhotoDialogWidget({
    Key? key,
    required this.onTapCamera,
    required this.onTapGallery,
  }) : super(key: key);

  void Function()? onTapCamera;
  void Function()? onTapGallery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
          const SizedBox(
            height: 24,
          ),
          const Divider(),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: onTapCamera,
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Photo from camera",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: onTapGallery,
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Photo from gallery",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
