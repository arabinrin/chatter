import 'package:chat_app/screens/complete_profile_page.dart';
import 'package:chat_app/screens/home_page.dart';
import 'package:chat_app/screens/login_page.dart';
import 'package:chat_app/screens/splashhome_page.dart';
import 'package:chat_app/screens/splashlogin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:uuid/uuid.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var uuid = const Uuid();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
          apiKey: 'AIzaSyDsIPtX0nJIx8Apd-X_nZjdv3aHsozvVmU',
          appId: '1:540924973009:android:6f7b24abc819ce35de5af0',
          messagingSenderId: '540924973009',
          projectId: 'chatapp-a7c93'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          home: AuthStateChanges(),
          builder: EasyLoading.init(),
        );
      }
    );
  }
}

AuthStateChanges() {
  return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const SplashPageHome();
        } else {
          return const SplashLoginPage();
        }
      });
}
