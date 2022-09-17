import 'package:beting_app/bottom_nevigation.dart';
import 'package:beting_app/sceens/login_signup/login_signup/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        primaryColorDark: Colors.black,
        
      ),
      theme: ThemeData(
        
        primarySwatch: Colors.teal,
         

      ),
       home: StreamBuilder(
           stream: auth.authStateChanges(),
           builder: (context, snapshot) {
             if(snapshot.connectionState==ConnectionState.active){
               if(snapshot.hasData){
                 return NavegationBar();
               }
             }
             if(snapshot.connectionState==ConnectionState.waiting){
               return Scaffold(body: Center(child: CircularProgressIndicator(),),);
             }
             return LoginScreen();
           }
       ),
       //const NavegationBar(),
    );
  }
}


