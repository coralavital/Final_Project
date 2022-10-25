// imports
import 'package:camera_camera/camera_camera.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:final_project/utils/colors.dart';
import 'package:final_project/utils/dimensions.dart';

// FoodPageBody class
class MainPageBody extends StatefulWidget {
  const MainPageBody({Key? key}) : super(key: key);

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody>
    with WidgetsBindingObserver {
  late CameraController _controller;
  late Future<void> _initController;
  var isCameraReady = false;
  late XFile imageFile;
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.size260;
  var isLoaded = true;
  @override
  void initState() {
    super.initState();
    initCamera();
    WidgetsBinding.instance.addObserver(this);
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    pageController.dispose();
    super.dispose();
  }

  Widget cameraWidget(context) {
    var camera = _controller.value;
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * camera.aspectRatio;
    if (scale < 1) scale = 1;
    return Transform.scale(scale: scale, child: CameraPreview(_controller));
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initController = _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {
      isCameraReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isLoaded
            ? SizedBox(
                height: Dimensions.size530,
                child: PageView.builder(
                    controller: pageController,
                    // itemCount for two cameras
                    itemCount: 2,
                    itemBuilder: (context, position) {
                      return _buildPageItem(position);
                    }),
              )
            : CircularProgressIndicator(
                color: AppColors.mainColor,
              ),
        DotsIndicator(
          dotsCount: 2,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.paraColor,
            size: Size.square(Dimensions.size10),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.size5)),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
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
        child: Stack(children: [
          FutureBuilder(
            future: _initController,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    cameraWidget(context),
                    //Align(
                    //    alignment: Alignment.bottomCenter,
                    //    child: Container(
                    //        color: AppColors.iconColor2,
                    //        child: Row(
                    //          mainAxisAlignment: MainAxisAlignment.center,
                    //          mainAxisSize: MainAxisSize.max,
                    //          children: [
                    //            IconButton(
                    //                iconSize: 40,
                    //                onPressed: () => {}, icon: null,)
                    //                //captureImage(context),
                    //                //icon: Icon(Icons.camera_alt))
                    //          ],
                    //        )))
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ]));
  }

  //captureImage(BuildContext context) {
  //  _controller.takePicture().then((file) {
  //    setState(() {
  //      imageFile = file;
  //    });
  //    if (mounted) {
  //      Navigator.push(
  //          context,
  //          MaterialPageRoute(
  //              builder: (context) => DisplayPictureScreen(image: imageFile)));
  //    }
  //  });
  //}
}

//class DisplayPictureScreen extends StatelessWidget {
//  final XFile image;
//  const DisplayPictureScreen({Key? key, required this.image}) : super(key: key);

//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(),
//      body: Container(
//          width: double.infinity,
//          height: double.infinity,
//          child: Image.file(File(image.path), fit: BoxFit.fill)),
//    );
//  }
//}
