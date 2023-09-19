import 'dart:async';

import 'package:flutter/material.dart';
import 'package:session_expired/Session/Session.dart';
import 'package:session_expired/Session/session_manager.dart';
import 'Pages/FirstPage.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

Session session= Session();
StreamController streamController=StreamController();

void redirect(){
  if(globalNavigatorKey.currentContext !=null){
    Navigator.pushReplacement(globalNavigatorKey.currentContext!, 
    MaterialPageRoute(builder: (context)=> FirstPage(session: session,)));
  }
}
  @override
  Widget build(BuildContext context) {
  if(globalNavigatorKey.currentContext!=null){
    session.startListener(streamController: streamController, context: globalNavigatorKey.currentContext!);
  }
    return SessionManager(

      onSessionExpired: () {
        if(globalNavigatorKey.currentContext!=null&& session.enabledLoginPage==true){
        {
          print('Session Expired');
          ScaffoldMessenger.of(globalNavigatorKey.currentContext!).showSnackBar(SnackBar(content: Container(
          color: Colors.black,
            child: const Text('Session Expired',style: TextStyle(
              color: Colors.white
            ),),
          ),),);
          redirect();
        }
        }
      },
      duration: const Duration(seconds: 3),
      streamController: streamController,
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: globalNavigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.purple
        ),
        home:  FirstPage(session: session,),
      ),
    );
  }
}

