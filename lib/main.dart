import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instafire_flutter/providers/user_provider.dart';
import 'package:instafire_flutter/responsive/mobile_layout.dart';
import 'package:instafire_flutter/responsive/responsive_screen.dart';
import 'package:instafire_flutter/responsive/web_layout.dart';
import 'package:instafire_flutter/screens/login.dart';
import 'package:instafire_flutter/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD3ugTSWU1zY5jmbSrI1Gcv8iIGjzNU20k",
            appId: "1:56343190792:web:8c832b7ac52ac8303ae0bd",
            messagingSenderId: "56343190792",
            projectId: "instafire-fm1",
            storageBucket: "instafire-fm1.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'InstaFire',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobilebackgroundcolor),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const ResponsiveLayout(
                      webscreenLayout: WebScreenLayout(),
                      mobilescreenLayout: MobileScreenLayout());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: primarycolor,
                  ),
                );
              }
              return const LoginScreen();
            }),
      ),
    );
  }
}
