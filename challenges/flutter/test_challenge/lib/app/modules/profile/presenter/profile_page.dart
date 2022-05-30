import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_challenge/app/modules/profile/presenter/profile_store.dart';
import 'package:test_challenge/app/modules/profile/presenter/states/profile_states.dart';
import 'package:test_challenge/app/modules/profile/presenter/widgets/photo_dialog/photo_dialog.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key? key, this.title = 'Profile'}) : super(key: key);
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final TextEditingController newPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ProfileStore store = Modular.get<ProfileStore>();

  @override
  void initState() {
    super.initState();
    store.addListener(() {
      if (store.value is SuccessProfileState) {
        store.globalInformations.updateUser();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text("Success to update user"),
          ),
        );
        Navigator.of(context).pop();
      }

      if (store.value is ErrorProfileState) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Error to update user!"),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    store.value = InitialProfileState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
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
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  store.user?.photoUrl ?? "",
                  height: 98.0,
                  width: 98.0,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    builder: (context) => PhotoDialogWidget(
                      onTapCamera: () async {
                        await _prepareCamera(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                      onTapGallery: () async {
                        await _prepareCamera(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                },
                child: const Text('Change profile picture'),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Email: ${store.user?.email ?? ""}',
              ),
              const SizedBox(
                height: 24,
              ),
              ValueListenableBuilder(
                valueListenable: store,
                builder: (context, value, _) {
                  if (value is LoadingProfileState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: TextFormField(
                      controller: newPassword,
                      decoration: const InputDecoration(
                        labelText: 'New password',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Field can't be empty";
                        }

                        if ((value ?? "").length < 6) {
                          return "Password need to contain 6 or more characters";
                        }

                        return null;
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState?.validate() ?? false) {
            await store.changeUserPassword(
              newPassword.text,
            );
          }
        },
        child: const Icon(
          Icons.done,
        ),
      ),
    );
  }

  Future<void> _prepareCamera(ImageSource type) async {
    final response = await ImagePicker().pickImage(
      source: type,
    );

    if (response != null) {
      Image.file(
        File(response.path),
        width: 500,
        height: 500,
      );
    }
  }
}
