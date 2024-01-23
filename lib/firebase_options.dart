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
    apiKey: 'AIzaSyAArZ0CuvmfxVj9oo9Z4N0kEpkRR3Lc9xc',
    appId: '1:276244221536:web:040ed17cae99dbfa1c3d05',
    messagingSenderId: '276244221536',
    projectId: 'calendar-scheduler-yk',
    authDomain: 'calendar-scheduler-yk.firebaseapp.com',
    storageBucket: 'calendar-scheduler-yk.appspot.com',
    measurementId: 'G-L52VY96P27',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCchoibzDMva1CUfKXYn4JrYEYzOJzYrYs',
    appId: '1:276244221536:android:3f06654621a8879f1c3d05',
    messagingSenderId: '276244221536',
    projectId: 'calendar-scheduler-yk',
    storageBucket: 'calendar-scheduler-yk.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGLRtl_l_hGzShWvjclk7S20s9bn1GuHM',
    appId: '1:276244221536:ios:3f2f131e2fb424971c3d05',
    messagingSenderId: '276244221536',
    projectId: 'calendar-scheduler-yk',
    storageBucket: 'calendar-scheduler-yk.appspot.com',
    iosBundleId: 'com.example.calendarScheduler',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGLRtl_l_hGzShWvjclk7S20s9bn1GuHM',
    appId: '1:276244221536:ios:85a5d96889d79a751c3d05',
    messagingSenderId: '276244221536',
    projectId: 'calendar-scheduler-yk',
    storageBucket: 'calendar-scheduler-yk.appspot.com',
    iosBundleId: 'com.example.calendarScheduler.RunnerTests',
  );
}