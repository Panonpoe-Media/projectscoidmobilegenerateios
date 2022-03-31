import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
        appId: '1:448618578101:web:0b650370bb29e29cac3efc',
        apiKey: 'AIzaSyAgUhHU8wSJgO5MVNy95tMT07NEjzMOfz0',
        projectId: 'react-native-firebase-testing',
        messagingSenderId: '448618578101',
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:206955057202:ios:898500e7d22afd6cb42c2b',
        apiKey: 'AIzaSyAhQGor8lxsVuBZdaveDkz7p16Af6pMcOM',
        projectId: 'projectscoid-125dd',
        messagingSenderId: '206955057202',
        iosBundleId: 'id.co.projectscoid',
      );
    } else {
      // Android
      return const FirebaseOptions(
        apiKey: 'AIzaSyDC6NSEYBNQXwTmxrKtW4zSFfMyW6eD3FI',
        appId: '1:206955057202:android:bec4a2a4b8a188a3b42c2b',
        messagingSenderId: '206955057202',
        projectId: 'projectscoid-125dd',
      );
    }
  }
}