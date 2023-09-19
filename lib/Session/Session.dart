import 'package:flutter/material.dart';
import 'dart:async';

class Session{
  BuildContext? context;
  StreamController? streamController;
  bool enabledLoginPage = false;

  void startListener({required StreamController streamController,
    required BuildContext context}){
    this.streamController=streamController;
    this.context= context;
    Map<String,dynamic> map ={'context':context,'timer':true};
    streamController.add(map);
}
  void stopistener({required StreamController streamController,
    required BuildContext context}){
    this.streamController=streamController;
    this.context= context;
    Map<String,dynamic> map ={'context':context,'timer':false};
    streamController.add(map);
  }

}