//import 'package:camera/camera.dart';
//import 'package:flutter/material.dart';
//import 'package:final_project/realtime/bounding_box.dart';
//import 'package:final_project/realtime/camera.dart';
//import 'dart:math' as math;
//import 'package:tflite/tflite.dart';

//class LiveFeed extends StatefulWidget {
//  LiveFeed({Key? key}) : super(key: key);
//  @override
//  _LiveFeedState createState() => _LiveFeedState();
//}

//class _LiveFeedState extends State<LiveFeed> {
//  late List<CameraDescription> cameras;
//  late List<dynamic> _recognitions;
//  int _imageHeight = 0;
//  int _imageWidth = 0;
//  Future<void> initCameras() async {
//    cameras = await availableCameras();
//  }

//  loadTfModel() async {
//    await Tflite.loadModel(
//      model: "assets/models/ssd_mobilenet.tflite",
//      labels: "assets/models/labels.txt",
//    );
//  }

//  /* 
//  The set recognitions function assigns the values of recognitions, imageHeight and width to the variables defined here as callback
//  */
//  setRecognitions(recognitions, imageHeight, imageWidth) {
//    setState(() {
//      _recognitions = recognitions;
//      _imageHeight = imageHeight;
//      _imageWidth = imageWidth;
//    });
//  }

//  @override
//  void initState() {
//    super.initState();
//    initCameras();
//    loadTfModel();
//  }

//  @override
//  Widget build(BuildContext context) {
//    Size screen = MediaQuery.of(context).size;
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Real Time Object Detection"),
//      ),
//      body: Stack(
//        children: <Widget>[
//          CameraFeed(cameras, setRecognitions),
//          BoundingBox(
//            _recognitions == null ? [] : _recognitions,
//            math.max(_imageHeight, _imageWidth),
//            math.min(_imageHeight, _imageWidth),
//            screen.height,
//            screen.width,
//          ),
//        ],
//      ),
//    );
//  }
//}
