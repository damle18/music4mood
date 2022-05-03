import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../main.dart';
import 'package:tflite/tflite.dart';


class CameraScreen extends StatefulWidget {
  const CameraScreen({ Key? key }) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output='';

  @override
  void initState() {
    super.initState();
    loadCamera();
    // loadModel();
  }

  CameraImage? get imageStream => null;

  loadCamera(){
    cameraController=CameraController(cameras![0],ResolutionPreset.medium);
    cameraController!.initialize().then((value){
      if(!mounted){
        return;
      }
      else{
        setState((){
          cameraController!.startImageStream((imageStream){
            cameraImage= imageStream;
            runModel();
          });
        });
      }
    });
    
  }

  runModel()async{
    if(cameraImage!=null){
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {return plane.bytes;}).toList(),// required
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,   // defaults to 127.5
          imageStd: 127.5,    // defaults to 127.5
          rotation: 90,       // defaults to 90, Android only
          numResults: 2,      // defaults to 5
          threshold: 0.1,     // defaults to 0.1
          asynch: true        // defaults to true
        );
      for (var element in predictions!) {
        setState(() {
          output=element['label'];
        });
      }
  }

  // loadModel()async{
  //   await Tflite.loadModel(model:"assets/model_unquant.tflite",labels:"assets/labels.txt");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:const Text('CameraScreen')),
      
      body:Column(
        children: [
          Padding(
            padding:EdgeInsets.all(20.0),
            child:Container(
              height:MediaQuery.of(context).size.height*0.7,
              width:MediaQuery.of(context).size.width,
              child:!cameraController!.value.isInitialized?
              Container():AspectRatio(aspectRatio:cameraController!.value.aspectRatio,
              child:CameraPreview(cameraController!))

            ),
          ),
          Text(output,
          style:const TextStyle(fontSize:20.0)),
        ],
      ),
    );
  }


  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }}

}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }}