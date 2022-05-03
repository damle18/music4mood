import 'package:flutter/material.dart';


class HowToUse extends StatefulWidget {
  const HowToUse({ Key? key }) : super(key: key);

  @override
  State<HowToUse> createState() => _HowToUseState();
}

class _HowToUseState extends State<HowToUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('App Tour'),
      ),
      body:Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding:const EdgeInsets.all(10.0),
              child:Text(
                'A brief Tour about our app ',
                textAlign:TextAlign.center,
                textDirection:TextDirection.ltr,
                style:TextStyle(
                  fontFamily:'Hersheys',
                  color:Colors.greenAccent[100],
                  fontSize:48.0,

                ),
              )
            ),
            
            
          ],)
      ),
    );
  }
}