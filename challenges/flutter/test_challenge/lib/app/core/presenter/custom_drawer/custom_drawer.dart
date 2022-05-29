import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_challenge/app/core/utils/dashboard_list.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

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
    );
  }
}
