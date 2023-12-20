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
    apiKey: 'AIzaSyCJ3o8mplFKqSGtgoHYOFAnYPKRYt68iYg',
    appId: '1:551434279378:web:cea043307b9c003ae5d00b',
    messagingSenderId: '551434279378',
    projectId: 'rantea-app',
    authDomain: 'rantea-app.firebaseapp.com',
    storageBucket: 'rantea-app.appspot.com',
    measurementId: 'G-L2RPC0MQZG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYDrTJ0yyJcay5Ne-lno8p4SGq0-Q0ruE',
    appId: '1:551434279378:android:6404577319a28f03e5d00b',
    messagingSenderId: '551434279378',
    projectId: 'rantea-app',
    storageBucket: 'rantea-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAbdw0zmX5kuKahweZffy4pdrNA3hjB_VM',
    appId: '1:551434279378:ios:3b814c085f6d4fede5d00b',
    messagingSenderId: '551434279378',
    projectId: 'rantea-app',
    storageBucket: 'rantea-app.appspot.com',
    iosBundleId: 'com.example.ranteaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAbdw0zmX5kuKahweZffy4pdrNA3hjB_VM',
    appId: '1:551434279378:ios:3b814c085f6d4fede5d00b',
    messagingSenderId: '551434279378',
    projectId: 'rantea-app',
    storageBucket: 'rantea-app.appspot.com',
    iosBundleId: 'com.example.ranteaApp',
  );
}