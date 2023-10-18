// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camera_app/settings.dart';
import 'package:flutter/material.dart';

import 'gallery_screen.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraScreen({
    Key? key,
    required this.cameras,
  }) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  FlashMode flashMode = FlashMode.off; // Initialize with flash off


  @override
  
  void initState() {          //perform one time initialization tasks
    initializeCamera(selectedCamera); 
    super.initState();
  }

  late CameraController _controller; 
    late Future<void>
      _initializeControllerFuture; //to ensure camera is initialized properly before use
  int selectedCamera = 0; //0-rear 1-front camera
  List<File> capturedImages = []; //to store pics

  initializeCamera(int cameraIndex) async {
    _controller = CameraController(
      widget.cameras[cameraIndex], //identify camera
      ResolutionPreset.max, //camera quality
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    
    _controller.dispose();//ensures camera is properly closed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //appbar
          AppBar(
            backgroundColor: Colors.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon:Icon(Icons.center_focus_strong_outlined)),
                //flash start
                //IconButton(onPressed: (){}, icon:Icon(Icons.flash_off_outlined)),
                IconButton(
  onPressed: () {
    setState(() {
      flashMode = flashMode == FlashMode.off ? FlashMode.torch : FlashMode.off;
      _controller.setFlashMode(flashMode);
    });
  },
  icon: Icon(
    flashMode == FlashMode.torch ? Icons.flash_on : Icons.flash_off_outlined,
  ),
),

                //flash end
                IconButton(onPressed: (){}, icon:Icon(Icons.hdr_on_rounded)),
                IconButton(onPressed: (){}, icon:Icon(Icons.macro_off_rounded)),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => Settingspage(),));
                }, icon:Icon(Icons.settings)),               
              ],
            ),
          ),
          //preview container
          // ignore: sized_box_for_whitespace   
          Container(
             height: MediaQuery.of(context).size.height * 0.8,//80%
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  
                  return CameraPreview(_controller);
                } else {
                  
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Spacer(), 
           //for camera switch
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (widget.cameras.length > 1) {
                      setState(() {
                        selectedCamera = selectedCamera == 1 ? 0 : 1;
                        initializeCamera(selectedCamera);
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('No secondary camera found'),
                        duration: const Duration(seconds: 2),
                      ));
                    }
                  },
                  icon: Icon(Icons.restart_alt, color: Colors.white,size: 40,),
                ),
                //for capture
                GestureDetector(
                  onTap: () async {
                    await _initializeControllerFuture;
                    var xFile = await _controller.takePicture();
                    setState(() {
                      capturedImages.add(File(xFile.path));
                    });
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(Icons.camera,size: 40,),
                  ),
                ),
                //for gallery
                GestureDetector(
                  onTap: () {
                    if (capturedImages.isEmpty) return;//if no images
                    Navigator.push(//if images
                        context,
                        MaterialPageRoute(
                            builder: (context) => GalleryScreen(
                                images: capturedImages.reversed.toList()//insert in reverse
                                )
                                ));
                  },
                  child: Container(//gallery icon...
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      image: capturedImages.isNotEmpty
                          ? DecorationImage(
                              image: FileImage(capturedImages.last),
                              fit: BoxFit.cover)
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
       Spacer(),
       
        ], 
      ),
    );
  }
}