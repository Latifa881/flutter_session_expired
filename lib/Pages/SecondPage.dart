import 'package:flutter/material.dart';
import 'package:session_expired/Pages/ThirdPage.dart';
import 'package:session_expired/Session/Session.dart';
import 'package:session_expired/main.dart';


class SecondPage extends StatefulWidget {
  Session session;
   SecondPage({super.key, required this.session});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(globalNavigatorKey.currentContext!).viewInsets.bottom > 0) {
      if(globalNavigatorKey.currentContext!=null){
        session.stopistener(streamController: streamController, context: globalNavigatorKey.currentContext!);
      }
      // softkeyboard is open
      // widget.session.enabledLoginPage =false;
      // print('keyboard is open');
      // print('widget.session.enabledLoginPage should false? ${widget.session.enabledLoginPage}');
    } else {
      if(globalNavigatorKey.currentContext!=null){
        session.startListener(streamController: streamController, context: globalNavigatorKey.currentContext!);
      }
      // widget.session.enabledLoginPage =true;
      //  //streamController.onResume;
      // print('keyboard is close ${globalNavigatorKey.currentContext}');
      // print('widget.session.enabledLoginPage should true? ${widget.session.enabledLoginPage}');

    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const  Text('Second Page',style: TextStyle(fontSize: 30)),
            const SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(

                  labelText: 'Enter Name',
                  hintText: 'Enter Your Name'
              ),
             //  onChanged: (value){
             //    checkKeyBoard(widget.session);
             //    print('onChanged');
             // //   widget.session.enabledLoginPage =false;
             //  },
              // // onEditingComplete: (){
              // //   print('onEditingComplete');
              // //   widget.session.enabledLoginPage =true;
              // // },
              //
              // onSubmitted: (value){
              //   print('onSubmitted');
              //   checkKeyBoard(widget.session);
              //   //widget.session.enabledLoginPage =true;
              //   print(widget.session.enabledLoginPage);
              // },
              // onTapOutside: (_){
              // //  pointDownEvent.
              //   checkKeyBoard(widget.session);
              //   print('onTapOutside');
              //  // widget.session.enabledLoginPage =true;
              // },
              // onTap: (){
              //   print('onTap');
              //   checkKeyBoard(widget.session);
              // //  widget.session.enabledLoginPage =true;
              // },
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ThirdPage()));
            },
                child:const Text('Open Third Page') )

          ],
        ),
      ),
    );
  }
}
