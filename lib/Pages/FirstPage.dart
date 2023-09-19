import 'package:flutter/material.dart';
import 'package:session_expired/Pages/SecondPage.dart';

import '../Session/Session.dart';

class FirstPage extends StatefulWidget {
  Session session;
   FirstPage({super.key,required this.session});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const  Text('First Page',style: TextStyle(fontSize: 30)),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              widget.session.enabledLoginPage =true;
              Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SecondPage(session: widget.session,)));
            },
                child:const Text('Open Second Page') )

          ],
        ),
      ),
    );
  }
}
