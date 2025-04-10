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
    apiKey: 'AIzaSyCeErNwtd1LlWLQzQNY_lgny_EVzpcakOU',
    appId: '1:960408265264:web:f0ae24bf827ad0ba1d43f5',
    messagingSenderId: '960408265264',
    projectId: 'drobb-application',
    authDomain: 'drobb-application.firebaseapp.com',
    storageBucket: 'drobb-application.firebasestorage.app',
    measurementId: 'G-8MM0X9GVQL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgqmxNSVjmD_T2LphWQb_Z73eVQNvHet0',
    appId: '1:960408265264:android:6a75e930d1f9ded51d43f5',
    messagingSenderId: '960408265264',
    projectId: 'drobb-application',
    storageBucket: 'drobb-application.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAihNkZ8MssY1difA1z2CRBjsxa2eQx4gk',
    appId: '1:960408265264:ios:fa83810145f226631d43f5',
    messagingSenderId: '960408265264',
    projectId: 'drobb-application',
    storageBucket: 'drobb-application.firebasestorage.app',
    iosBundleId: 'com.example.drobb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAihNkZ8MssY1difA1z2CRBjsxa2eQx4gk',
    appId: '1:960408265264:ios:fa83810145f226631d43f5',
    messagingSenderId: '960408265264',
    projectId: 'drobb-application',
    storageBucket: 'drobb-application.firebasestorage.app',
    iosBundleId: 'com.example.drobb',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCeErNwtd1LlWLQzQNY_lgny_EVzpcakOU',
    appId: '1:960408265264:web:bf3d0f7c78bbd0781d43f5',
    messagingSenderId: '960408265264',
    projectId: 'drobb-application',
    authDomain: 'drobb-application.firebaseapp.com',
    storageBucket: 'drobb-application.firebasestorage.app',
    measurementId: 'G-7LNBVMNQFS',
  );

}