
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDGbEujXtuTWz11SIIfAs25b8tqPzVTpZw',
    appId: '1:822311953206:web:934477204f9314e888c997',
    messagingSenderId: '822311953206',
    projectId: 'pharmacygaza',
    authDomain: 'pharmacygaza.firebaseapp.com',
    storageBucket: 'pharmacygaza.firebasestorage.app',
    measurementId: 'G-3C8VMLS70H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDodNmi0_jxu6Gz_BTpKqpYdj1O34BVVtc',
    appId: '1:822311953206:android:26b4909be4b1fee288c997',
    messagingSenderId: '822311953206',
    projectId: 'pharmacygaza',
    storageBucket: 'pharmacygaza.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVozbqsvvaJxDhHCAhIAfB_NWWrg9MeL0',
    appId: '1:822311953206:ios:9ddf4f1fbbc8709d88c997',
    messagingSenderId: '822311953206',
    projectId: 'pharmacygaza',
    storageBucket: 'pharmacygaza.firebasestorage.app',
    iosBundleId: 'com.example.pharmacyGaza',
  );
}
