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
    apiKey: 'AIzaSyCBs65RztlFeaEg4noluCZ6TmU2NoN56I4',
    appId: '1:357411246273:web:a66f011beb8f384c2d4440',
    messagingSenderId: '357411246273',
    projectId: 'whatsapp-clone-899ef',
    authDomain: 'whatsapp-clone-899ef.firebaseapp.com',
    storageBucket: 'whatsapp-clone-899ef.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJESyGNkAMZ1fFZVzK8twRs_UqfE1_8WI',
    appId: '1:357411246273:android:3b62438e6f51224a2d4440',
    messagingSenderId: '357411246273',
    projectId: 'whatsapp-clone-899ef',
    storageBucket: 'whatsapp-clone-899ef.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBWqawzJFBCQD4Fkb2T_ooj-EMKAv-0rk',
    appId: '1:357411246273:ios:c96d3f0a2b8ca7c62d4440',
    messagingSenderId: '357411246273',
    projectId: 'whatsapp-clone-899ef',
    storageBucket: 'whatsapp-clone-899ef.appspot.com',
    iosClientId: '357411246273-s1gnr4dc9v1tc2s6igtnqg0c27ablfja.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsappClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBWqawzJFBCQD4Fkb2T_ooj-EMKAv-0rk',
    appId: '1:357411246273:ios:195b3e1601093a382d4440',
    messagingSenderId: '357411246273',
    projectId: 'whatsapp-clone-899ef',
    storageBucket: 'whatsapp-clone-899ef.appspot.com',
    iosClientId: '357411246273-3k91g1cv03i4mfjgvg0j66ongafcp0j3.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsappClone.RunnerTests',
  );
}