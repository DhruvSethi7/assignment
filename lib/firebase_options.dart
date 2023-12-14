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
        return macos;
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
    apiKey: 'AIzaSyDebD3BzDW4M9S9zx9RfNEnznXyOPYe5-o',
    appId: '1:951607762485:web:90771f9c66ae6476f11b7c',
    messagingSenderId: '951607762485',
    projectId: 'assignment-77738',
    authDomain: 'assignment-77738.firebaseapp.com',
    storageBucket: 'assignment-77738.appspot.com',
    measurementId: 'G-RLDGYWLJ48',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgguwfMoBMD9qw-E1KaWqctEeUarz5UP4',
    appId: '1:951607762485:android:98e7762a081fa3a6f11b7c',
    messagingSenderId: '951607762485',
    projectId: 'assignment-77738',
    storageBucket: 'assignment-77738.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvq8OW6dI3J-qGvpAtlT7X8DZ_Wbhcvss',
    appId: '1:951607762485:ios:ac1e359a0a4c727bf11b7c',
    messagingSenderId: '951607762485',
    projectId: 'assignment-77738',
    storageBucket: 'assignment-77738.appspot.com',
    iosBundleId: 'com.example.assignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBvq8OW6dI3J-qGvpAtlT7X8DZ_Wbhcvss',
    appId: '1:951607762485:ios:433c085f9b838615f11b7c',
    messagingSenderId: '951607762485',
    projectId: 'assignment-77738',
    storageBucket: 'assignment-77738.appspot.com',
    iosBundleId: 'com.example.assignment.RunnerTests',
  );
}
