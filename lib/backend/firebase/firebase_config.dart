import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA7HuJIJcNOcil8UhefIy0rwgzewezPbrE",
            authDomain: "lifeos-a7adc.firebaseapp.com",
            projectId: "lifeos-a7adc",
            storageBucket: "lifeos-a7adc.firebasestorage.app",
            messagingSenderId: "125416325524",
            appId: "1:125416325524:web:13554331a347b15d48cf81",
            measurementId: "G-WWCXTW0EBP"));
  } else {
    await Firebase.initializeApp();
  }
}
