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
    apiKey: 'AIzaSyDBWrArhIcX-SHpZ_a_XlrMEsBCPaRNc_Q',
    appId: '1:630622279871:web:06a47182eabd7355a14e0a',
    messagingSenderId: '630622279871',
    projectId: 'nsi-qc',
    authDomain: 'nsi-qc.firebaseapp.com',
    storageBucket: 'nsi-qc.appspot.com',
    measurementId: 'G-558Y5FGKHV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJAQR2eF4njXero5iqexwvO-sBCfrVqgo',
    appId: '1:630622279871:android:262cabdd9cda6360a14e0a',
    messagingSenderId: '630622279871',
    projectId: 'nsi-qc',
    storageBucket: 'nsi-qc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD7a7i6JeLoquiFK4RSAW7VYPm06HrcmTY',
    appId: '1:630622279871:ios:985312e047749fa7a14e0a',
    messagingSenderId: '630622279871',
    projectId: 'nsi-qc',
    storageBucket: 'nsi-qc.appspot.com',
    iosClientId: '630622279871-gjkp2e5t1sonvpbsl66hl767faqvbd6a.apps.googleusercontent.com',
    iosBundleId: 'com.nsi.qcNis',
  );
}
