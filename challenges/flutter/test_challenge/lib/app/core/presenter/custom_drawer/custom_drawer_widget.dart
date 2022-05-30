import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_challenge/app/core/utils/dashboard_list.dart';
import 'package:test_challenge/app/core/utils/global_informations.dart';

class CustomDrawerWidget extends StatelessWidget {
  final IGlobalInformations globalInformations = Modular.get();

  CustomDrawerWidget({
    Key? key,
    required this.onTapLogout,
  }) : super(key: key);

  final Function()? onTapLogout;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO - Load user image
                SizedBox(
                  height: 64,
                  width: 64,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.network(
                      globalInformations.user?.photoUrl ?? "",
                      height: 64.0,
                      width: 64.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // TODO - Dynamic name
                Text(
                  globalInformations.user?.email ?? "",
                ),
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
            onTap: onTapLogout,
          ),
        ],
      ),
    );
  }
}
