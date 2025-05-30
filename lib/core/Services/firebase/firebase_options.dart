// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyB-s6DQWd7_aFQH8axaaWoDR5m-ngW4Xms',
    appId: '1:657127227252:web:8068b3395d1b6644433621',
    messagingSenderId: '657127227252',
    projectId: 'banking-mobile-ac1c4',
    authDomain: 'banking-mobile-ac1c4.firebaseapp.com',
    storageBucket: 'banking-mobile-ac1c4.firebasestorage.app',
    measurementId: 'G-1YFQNDH1CY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6wzaojH6ih-1Zmmoqr7hXmE1uuS2uqbY',
    appId: '1:657127227252:android:823cc6a92c6d5ee0433621',
    messagingSenderId: '657127227252',
    projectId: 'banking-mobile-ac1c4',
    storageBucket: 'banking-mobile-ac1c4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKJ6Whl_gsPnEAlZ4PCaywhl1xb-gW0lQ',
    appId: '1:657127227252:ios:dfa92e3d991f3f08433621',
    messagingSenderId: '657127227252',
    projectId: 'banking-mobile-ac1c4',
    storageBucket: 'banking-mobile-ac1c4.firebasestorage.app',
    iosBundleId: 'com.example.bankingMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKJ6Whl_gsPnEAlZ4PCaywhl1xb-gW0lQ',
    appId: '1:657127227252:ios:dfa92e3d991f3f08433621',
    messagingSenderId: '657127227252',
    projectId: 'banking-mobile-ac1c4',
    storageBucket: 'banking-mobile-ac1c4.firebasestorage.app',
    iosBundleId: 'com.example.bankingMobile',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB-s6DQWd7_aFQH8axaaWoDR5m-ngW4Xms',
    appId: '1:657127227252:web:7fd8a617f926b9cb433621',
    messagingSenderId: '657127227252',
    projectId: 'banking-mobile-ac1c4',
    authDomain: 'banking-mobile-ac1c4.firebaseapp.com',
    storageBucket: 'banking-mobile-ac1c4.firebasestorage.app',
    measurementId: 'G-6HC75HCLFV',
  );
}
