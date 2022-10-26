// imports

import 'package:camera_camera/camera_camera.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:final_project/realtime/camera.dart';
import 'package:flutter/material.dart';
import 'package:final_project/utils/colors.dart';
import 'package:final_project/utils/dimensions.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;
import '../../realtime/bounding_box.dart';

// FoodPageBody class
class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPage();
}

class _CameraPage extends State<CameraPage> with WidgetsBindingObserver {
  //late CameraController _controller;
  //late final camerasList;
  //late Future<void> _initController;
  var isCameraReady = false;
  //late XFile imageFile;

  bool isWorking = false;
  List<dynamic> _currentRecognition = [];

  late CameraController cameraController;
  late CameraImage imgCamera;
  //loadModel() async {
  //  await Tflite.loadModel(
  //      model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
  //}

  initCamera() async {
    final cameras = await availableCameras();
    final firstcamera = cameras.first;
    cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        isCameraReady = true;
        cameraController.startImageStream((imageFromStream) => {
              if (!isWorking)
                {
                  isWorking = true,
                  imgCamera = imageFromStream,
                  runModelOnStreamFrames(),
                }
            });
      });
    });
  }

  loadTfModel() async {
    await Tflite.loadModel(
      model: "assets/ssd_mobilenet.tflite",
      labels: "assets/labels.txt",
    );
  }

  PageController pageController = PageController(viewportFraction: 0.92);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.size260;

  List<dynamic> _recognitions = List.empty();
  int _imageHeight = 0;
  int _imageWidth = 0;

  @override
  void initState() {
    super.initState();
    initCamera();
    loadTfModel();
    WidgetsBinding.instance.addObserver(this);
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    isCameraReady = false;
    WidgetsBinding.instance.removeObserver(this);
    cameraController.dispose();
    pageController.dispose();
  }

  Widget cameraWidget(context) {
    var camera = cameraController.value;
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * camera.aspectRatio;
    if (scale < 1) scale = 1;
    return Transform.scale(
        scale: scale,
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            child: CameraPreview(cameraController)));
  }

  runModelOnStreamFrames() async {
    if (imgCamera != null) {
      var recognitions = await Tflite.detectObjectOnFrame(
        bytesList: imgCamera.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        model: "SSDMobileNet",
        imageHeight: imgCamera.height,
        imageWidth: imgCamera.width,
        imageMean: 127.5,
        imageStd: 127.5,
        numResultsPerClass: 1,
        threshold: 0.4,
      ).then((recognitions) {
        setRecognitions(recognitions, imgCamera.height, imgCamera.width);
      });

      isWorking = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isCameraReady
            ? SizedBox(
                height: Dimensions.size510,
                child: PageView.builder(
                    controller: pageController,
                    // itemCount for two cameras
                    itemCount: 2,
                    itemBuilder: (context, position) {
                      return _buildPageItem(position);
                    }),
              )
            : Container(height: Dimensions.size510, alignment: Alignment.center ,child: CircularProgressIndicator(
                color: AppColors.mainColor,
              ),),
        DotsIndicator(
          dotsCount: 2,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.paraColor,
            size: Size.square(Dimensions.size7),
            activeSize: const Size(18.0, 10.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.size5)),
          ),
        )
      ],
    );
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  Widget _buildPageItem(int index) {
    Size screen = MediaQuery.of(context).size;
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }
    return Transform(
        transform: matrix,
        child: Stack(children: <Widget>[
          cameraWidget(context),
          BoundingBox(
            _recognitions,
            math.max(_imageHeight, _imageWidth),
            math.min(_imageHeight, _imageWidth),
            screen.height*0.80,
            screen.width*0.80,
          ),
        ]));
  }
}
