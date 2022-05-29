// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBuNr1ox5XqI4bS20G_EHD_TWZw76G7bqE',
    appId: '1:270601464846:web:d5a2a595f46516d5b8a05f',
    messagingSenderId: '270601464846',
    projectId: 'car-on-sale-challenge',
    authDomain: 'car-on-sale-challenge.firebaseapp.com',
    storageBucket: 'car-on-sale-challenge.appspot.com',
    measurementId: 'G-NDC8QT4LYB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB66ApmndplpwlHhIwKD5VQN0BtH5jjrv0',
    appId: '1:270601464846:android:305b51591f50d7ecb8a05f',
    messagingSenderId: '270601464846',
    projectId: 'car-on-sale-challenge',
    storageBucket: 'car-on-sale-challenge.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDb528_px5EAjNSUQvXfZBvPeNSbHOnMBo',
    appId: '1:270601464846:ios:ba4425782762e6bab8a05f',
    messagingSenderId: '270601464846',
    projectId: 'car-on-sale-challenge',
    storageBucket: 'car-on-sale-challenge.appspot.com',
    iosClientId: '270601464846-mj6sl0cc1o7gfnliacahe33c1nrkilpb.apps.googleusercontent.com',
    iosBundleId: 'com.example.testChallenge',
  );
}