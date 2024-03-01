import 'package:easacc_web_view/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/login/check_user.dart';
/////////////////////////////////////////////////////
////////.    Eng:  Gamal Abdle Nasser Mahmoud  ///////////
///      phone1:  +201112102609              ///////
///     phone12:  +201020583759.            //////
///      Email:   gamal.n1991@gmail.com   /////////
////////  Easacc Project Test  ////////////////
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
      home:  const CheckLoginState()
             ,
    );
  }
}
