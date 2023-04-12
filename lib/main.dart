import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/modules/auth_sign/auth_bindings.dart';

import 'routes/app_imports.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyCW6CKYFZOw4W2g0X7EY0fEniGDEx-nDLQ",
    projectId: "market-shopping-1e93e",
    messagingSenderId: "144793920843",
    appId: "1:144793920843:web:4a3af6e62dfb3ae6b474ce",
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBindings(),
      getPages: AppPages.pages,
      initialRoute: AuthPage.routeName,
      title: 'Market',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
