import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';

//void main() => runApp(MyApp());

List<CameraDescription> cameras;

Future<void> main() async {
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Camera',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Camera Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  CameraController controller;
  String imagePath;
  String videoPath;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print('Total no. of cameras : $cameras');
    _switchCamera();
  }

  void _switchCamera() async{

    if(controller != null)
      await controller.dispose();

    if(controller == null ||
        controller.description.lensDirection == CameraLensDirection.front){
      print('Switching back camera.');
      controller = CameraController(cameras[0], ResolutionPreset.medium);
    } else {
      print('Switching front camera.');
      controller = CameraController(cameras[1], ResolutionPreset.medium);
    }

    controller.addListener((){
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });

//    controller.initialize().then((_){
//      if (!mounted) {
//        return;
//      }
//      setState(() {});
//    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      print('Error while switching camera: ${e.code} ,  ${e.description}');
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget _addCameraWidget(){

    if(controller == null || !controller.value.isInitialized){
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller),
      );
    }
  }

  Widget _addCameraControlRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.switch_camera),
          color: Colors.blue,
          onPressed: (){
            _switchCamera();
          },
        ),
        IconButton(
          icon: const Icon(Icons.camera_alt),
          color: Colors.blue,
          onPressed: (){},
        ),
        IconButton(
          icon: const Icon(Icons.videocam),
          color: Colors.blue,
          onPressed: (){},
        ),
        IconButton(
          icon: const Icon(Icons.stop),
          color: Colors.red,
          onPressed: (){},
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Flutter Camera', style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromRGBO(50, 60, 80, 1.0),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Center(
                    child: _addCameraWidget(),
                  ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: controller != null && controller.value.isRecordingVideo
                      ? Colors.redAccent
                      : Colors.white,
                  width: 1.0,
                ),
              ),
            ),
          ),
          _addCameraControlRowWidget(),
        ],
      ),
    );
  }
}
