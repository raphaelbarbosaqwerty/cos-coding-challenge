import 'dart:ffi';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_challenge/app/modules/profile/presenter/profile_store.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key? key, this.title = 'Profile'}) : super(key: key);
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final ProfileStore store = Modular.get<ProfileStore>();

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                height: 98,
                width: 98,
                child: CircleAvatar(
                  child: Text('IMG'),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Name: User name',
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Email: User email',
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Old password',
                ),
                obscureText: true,
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'New password',
                ),
                obscureText: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO - Change password action
        },
        child: const Icon(
          Icons.done,
        ),
      ),
    );
  }
}
