
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
    apiKey: 'AIzaSyDxju8dklYBLGgr-YgT8e3JnXjgaCpqS68',
    appId: '1:138613565833:web:4c1d8b738b7ba6c04d1958',
    messagingSenderId: '138613565833',
    projectId: 'lifepill-mobile-app',
    authDomain: 'lifepill-mobile-app.firebaseapp.com',
    storageBucket: 'lifepill-mobile-app.appspot.com',
    measurementId: 'G-NHCG3XMN28',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOSPcOD3MfG_Ezj8h3D1zhtY_iN1drov8',
    appId: '1:138613565833:android:3d058eb1ac554f5b4d1958',
    messagingSenderId: '138613565833',
    projectId: 'lifepill-mobile-app',
    storageBucket: 'lifepill-mobile-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAnSUIoUKqZxmSHVuMRpaLIw1jFKLUE3o',
    appId: '1:138613565833:ios:d06a773d0149290d4d1958',
    messagingSenderId: '138613565833',
    projectId: 'lifepill-mobile-app',
    storageBucket: 'lifepill-mobile-app.appspot.com',
    androidClientId: '138613565833-bnqme3odhc0tkviaqanhp5p5sc0uls81.apps.googleusercontent.com',
    iosClientId: '138613565833-mlmh9olpd28err0rua0krt6tk9auibek.apps.googleusercontent.com',
    iosBundleId: 'com.example.patientmobileapplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDAnSUIoUKqZxmSHVuMRpaLIw1jFKLUE3o',
    appId: '1:138613565833:ios:d06a773d0149290d4d1958',
    messagingSenderId: '138613565833',
    projectId: 'lifepill-mobile-app',
    storageBucket: 'lifepill-mobile-app.appspot.com',
    androidClientId: '138613565833-bnqme3odhc0tkviaqanhp5p5sc0uls81.apps.googleusercontent.com',
    iosClientId: '138613565833-mlmh9olpd28err0rua0krt6tk9auibek.apps.googleusercontent.com',
    iosBundleId: 'com.example.patientmobileapplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDxju8dklYBLGgr-YgT8e3JnXjgaCpqS68',
    appId: '1:138613565833:web:cb1820a776052d264d1958',
    messagingSenderId: '138613565833',
    projectId: 'lifepill-mobile-app',
    authDomain: 'lifepill-mobile-app.firebaseapp.com',
    storageBucket: 'lifepill-mobile-app.appspot.com',
    measurementId: 'G-H0WG4KJL4B',
  );

}