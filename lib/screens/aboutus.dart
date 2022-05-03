import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text(
          'About the creators',
        ),
      ),

      body:Container(
        // color:Colors.black87,
        child:Column(
          children: [

            Container(
              padding:const EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
              // margin:EdgeInsets.fromLTRB(),
              child:Text( 
                'About the creators',
                style:TextStyle(
                  color:Colors.greenAccent[100],
                  fontFamily:'Hersheys',
                  fontSize:48.0,
                  shadows:const [
                    Shadow(
                      color:Colors.black45,
                      offset:Offset(5.0,5.0),
                      blurRadius:10.0,
                    )  
                  ]

                ),
              ),
            ),//Container 1

            Container(
              child:Row(
                children:[
                  Container(

                  ),
              ],  )
            ),//Container 2





            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}