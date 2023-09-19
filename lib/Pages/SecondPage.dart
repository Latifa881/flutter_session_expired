import 'package:flutter/material.dart';
import 'package:session_expired/Pages/ThirdPage.dart';
import 'package:session_expired/Session/Session.dart';


class SecondPage extends StatefulWidget {
  Session session;
   SecondPage({super.key, required this.session});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const  Text('Second Page',style: TextStyle(fontSize: 30)),
            const SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter Name',
                  hintText: 'Enter Your Name'
              ),
              onChanged: (value){
                widget.session.enabledLoginPage =false;
              },
              // onEditingComplete: (){
              //   widget.session.enabledLoginPage =true;
              // },
              onTapOutside: (pointDownEvent){
              //  pointDownEvent.
                widget.session.enabledLoginPage =true;
              },
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
