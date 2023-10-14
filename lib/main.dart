import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'camera_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();//ensures flutter is ready
  final cameras = await availableCameras();//retrieves available cameras
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   appBarTheme:  AppBarTheme(color: Colors.black,centerTitle: true),
      // ),
      
      title: 'Camera App',
      home: CameraScreen(cameras: cameras),
      debugShowCheckedModeBanner: false,
      
    );
  }
}

