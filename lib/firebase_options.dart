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
    apiKey: 'AIzaSyANwl4GJmQXDRXC4Knzn4A7wT-eohwR2xI',
    appId: '1:738032471948:web:7955d6c82acd2820c090a9',
    messagingSenderId: '738032471948',
    projectId: 'instagram-clone-1c790',
    authDomain: 'instagram-clone-1c790.firebaseapp.com',
    storageBucket: 'instagram-clone-1c790.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdm33bEAZm47zVPp3EvVkofaUb3U9MF0M',
    appId: '1:738032471948:android:0c9cd13454f6c0dfc090a9',
    messagingSenderId: '738032471948',
    projectId: 'instagram-clone-1c790',
    storageBucket: 'instagram-clone-1c790.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB49gboU8qyYrGWbPoqzXtQAZnIzxTbgsU',
    appId: '1:738032471948:ios:f3256b34f653e3bec090a9',
    messagingSenderId: '738032471948',
    projectId: 'instagram-clone-1c790',
    storageBucket: 'instagram-clone-1c790.appspot.com',
    iosClientId: '738032471948-kga74nm1lns76j6c560j3s3drndif0ep.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagramClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB49gboU8qyYrGWbPoqzXtQAZnIzxTbgsU',
    appId: '1:738032471948:ios:206e4f5903cb3c77c090a9',
    messagingSenderId: '738032471948',
    projectId: 'instagram-clone-1c790',
    storageBucket: 'instagram-clone-1c790.appspot.com',
    iosClientId: '738032471948-pdcgia0j152cmufd5ho7qhpqd3t8mnjn.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagramClone.RunnerTests',
  );
}
