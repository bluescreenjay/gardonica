import 'package:flutter/material.dart';
import 'package:Test_2/humpage.dart';


class InfoRoute extends StatelessWidget {
  const InfoRoute({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: const Color(0xff20a100),

          child: ListView(

            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(40, 50, 40, 150),
                child:          const Text(
                  'Welcome to Gardonica, your personal gardening assistant! We at Gardonica found that a topic that is often neglected is the importance of cultivating a healthy individual relationship with the natural world. It’s often hard to find resources and know where to get started. Gardonica is meant to serve as an educational tool, giving beginner gardeners guidance as they try to decide what to plant. Are you looking to use Gardonica to get started? Just answer the questions on this page and submit! Based on differently weighted factors, we’ll give you suggestions on what to plant, building off of the preferences and conditions you mentioned. We’re excited to help you along the wonderful path of gardening!',
                  style: TextStyle(fontSize: (30), color: Colors.black, fontFamily: 'bree-serif'),

                ),),
              SizedBox(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: const  Text('Back', style: TextStyle(fontFamily:'bree-serif', fontSize: 40),) )
              ),
            ],
          ),
        ),
      ),
    );
  }
}