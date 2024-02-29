import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easacc_web_view/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/login/check_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easacc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        // check if is inter net commectin
        
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            switch (snapshot.data) {
              case ConnectivityResult.mobile:
              case ConnectivityResult.wifi:
              case ConnectivityResult.bluetooth:
                return const CheckLoginState();
              default:
                return const Scaffold(
                  body: Center(
                    child: Icon(
                      Icons.wifi_off,color: Colors.grey,
                      size: 80,
                    ),
                  ),
                );
            }
          }),
    );
  }
}
