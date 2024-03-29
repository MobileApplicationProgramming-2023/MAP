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
    apiKey: 'AIzaSyDe3c2zaQsYC2GKxcoJWD1__LKsDT-rmoc',
    appId: '1:661374301254:web:f2d574a6342624ae1cc647',
    messagingSenderId: '661374301254',
    projectId: 'restreservedb',
    authDomain: 'restreservedb.firebaseapp.com',
    storageBucket: 'restreservedb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYIbzaFt_zXCDT0qYR16iLOaoNLD24-HM',
    appId: '1:661374301254:android:e216864c8a1330b41cc647',
    messagingSenderId: '661374301254',
    projectId: 'restreservedb',
    storageBucket: 'restreservedb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBUCZCTjC-K1p6uf50zhmD7m_c0DErVE4',
    appId: '1:661374301254:ios:f92b70a5308ee7fd1cc647',
    messagingSenderId: '661374301254',
    projectId: 'restreservedb',
    storageBucket: 'restreservedb.appspot.com',
    iosBundleId: 'com.example.restaurantReservation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBUCZCTjC-K1p6uf50zhmD7m_c0DErVE4',
    appId: '1:661374301254:ios:ffc8970c8beeb00b1cc647',
    messagingSenderId: '661374301254',
    projectId: 'restreservedb',
    storageBucket: 'restreservedb.appspot.com',
    iosBundleId: 'com.example.restaurantReservation.RunnerTests',
  );
}
