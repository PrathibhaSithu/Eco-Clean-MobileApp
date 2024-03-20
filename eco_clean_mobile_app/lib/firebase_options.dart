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
    apiKey: 'AIzaSyB5inOy5bZpZCSi51XyckX3S9nR9P_ju1M',
    appId: '1:15406546807:web:197ad175730c0a5ef3ab72',
    messagingSenderId: '15406546807',
    projectId: 'eco-clean-b0119',
    authDomain: 'eco-clean-b0119.firebaseapp.com',
    databaseURL: 'https://eco-clean-b0119-default-rtdb.firebaseio.com',
    storageBucket: 'eco-clean-b0119.appspot.com',
    measurementId: 'G-PW9Z00BZVR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCX2Fnbj6g3-S6xNCuYKcYN5GQOnAL8oe0',
    appId: '1:15406546807:android:6cc407a4bad3b7faf3ab72',
    messagingSenderId: '15406546807',
    projectId: 'eco-clean-b0119',
    databaseURL: 'https://eco-clean-b0119-default-rtdb.firebaseio.com',
    storageBucket: 'eco-clean-b0119.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEeuO0ook6RDCNLlhexhZG33VGnycaZUU',
    appId: '1:15406546807:ios:2d91dd06e1b2663bf3ab72',
    messagingSenderId: '15406546807',
    projectId: 'eco-clean-b0119',
    databaseURL: 'https://eco-clean-b0119-default-rtdb.firebaseio.com',
    storageBucket: 'eco-clean-b0119.appspot.com',
    iosBundleId: 'com.example.ecoCleanMobileApp',
  );
}