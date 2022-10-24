import 'dart:io';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';

class Cameras extends StatefulWidget {
  Cameras({Key? key}) : super(key: key);

  @override
  _CamerasState createState() => _CamerasState();
}

class _CamerasState extends State<Cameras> {
  final photos = <File>[];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(body: CameraCamera(
      onFile: (file) {
        photos.add(file);
        Navigator.pop(context);
        setState(() {});
      },
    ));
  }
}
