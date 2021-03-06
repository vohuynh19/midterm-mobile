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
    apiKey: 'AIzaSyDe0Hu4rNSU3csh2L3sT5HIsDbH-rTXun8',
    appId: '1:483147210838:web:1425b17b06b7d1dbf89bf7',
    messagingSenderId: '483147210838',
    projectId: 'ecom-73344',
    authDomain: 'ecom-73344.firebaseapp.com',
    databaseURL: 'https://ecom-73344-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ecom-73344.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAu_it7A9vzI2LjJa_zulSe4AEjo3d37wM',
    appId: '1:483147210838:android:fa8a916cd2cc4e6cf89bf7',
    messagingSenderId: '483147210838',
    projectId: 'ecom-73344',
    databaseURL: 'https://ecom-73344-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ecom-73344.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBnmiKPJH7q67lbXtCAeJtVuRMwUO7-Nlo',
    appId: '1:483147210838:ios:e73abf9a97010d05f89bf7',
    messagingSenderId: '483147210838',
    projectId: 'ecom-73344',
    databaseURL: 'https://ecom-73344-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ecom-73344.appspot.com',
    iosClientId: '483147210838-din97hjsodjl5vs03tabbr3ikv1t3pee.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceMidterm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBnmiKPJH7q67lbXtCAeJtVuRMwUO7-Nlo',
    appId: '1:483147210838:ios:e73abf9a97010d05f89bf7',
    messagingSenderId: '483147210838',
    projectId: 'ecom-73344',
    databaseURL: 'https://ecom-73344-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ecom-73344.appspot.com',
    iosClientId: '483147210838-din97hjsodjl5vs03tabbr3ikv1t3pee.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceMidterm',
  );
}
