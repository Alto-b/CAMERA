import 'package:flutter/material.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {

     bool val=false;//for switch

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("SETTINGS"),
        centerTitle: true,
        
      ),
      backgroundColor: Colors.black,
      //body
      body: Padding(
        
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            const Row(
              children: [
                SizedBox(width:15),
                Text("GENERAL",style: TextStyle(color: Colors.grey),),
                
              ],
            ),
            const SizedBox(height: 10,),
            ListTile(
              title: const Text("Shutter Sound",style: TextStyle(color: Colors.white),),
              trailing:Switch(value: val, onChanged: (value) {
                        setState(() {
                          if(val==false){
                            val=true;
                          }else{
                            val=false;
                          }
                        });
                      },
                     inactiveTrackColor: Color.fromARGB(255, 103, 103, 103), )
            ),
            const SizedBox(height: 10,),
            ListTile(
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Location",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
                  Text("Show location info in photo and video details",
                    style: TextStyle(color: Color.fromARGB(255, 111, 110, 110),fontSize: 13),),
                ],
              ),
              trailing:Switch(value: val, onChanged: (value) {
                        setState(() {
                          if(val==false){
                            val=true;
                          }else{
                            val=false;
                          }
                        });
                      },
                      inactiveTrackColor: Color.fromARGB(255, 103, 103, 103),)
            ),
            const SizedBox(height: 20,),
            ListTile(
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mirrored selfie",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
                  Text("Keep the finished photo or video and the preview identical when using the front camera",
                    style: TextStyle(color: Color.fromARGB(255, 111, 110, 110),fontSize: 13),),
                ],
              ),
              trailing:Switch(value: val, onChanged: (value) {
                        setState(() {
                          if(val==false){
                            val=true;
                          }else{
                            val=false;
                          }
                        });
                      },
                      inactiveTrackColor: Color.fromARGB(255, 103, 103, 103),)
            ),
            const SizedBox(height: 20,),
             const ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Micro gimbal calibration",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
                  Text("The micro gimbal helps satbilize the phone when shooting with the rear camera ",
                    style: TextStyle(color: Color.fromARGB(255, 111, 110, 110),fontSize: 13),),
                ],
              ),
              // trailing:Switch(value: val, onChanged: (value) {
              //           setState(() {
              //             if(val==false){
              //               val=true;
              //             }else{
              //               val=false;
              //             }
              //           });
              //         },)
            ),
            const SizedBox(height: 20,),
            const ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Keep settings",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
                  // Text("The micro gimbal helps satbilize the phone when shooting with the rear camera ",
                  //   style: TextStyle(color: Color.fromARGB(255, 111, 110, 110),fontSize: 13),),
                ],
              ),
              // trailing:Switch(value: val, onChanged: (value) {
              //           setState(() {
              //             if(val==false){
              //               val=true;
              //             }else{
              //               val=false;
              //             }
              //           });
              //         },)
            ),const SizedBox(height: 20,),
            const ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Motion Autofocus",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
                  Text("Track and focus on subjects in real time to capture clear images ",
                    style: TextStyle(color: Color.fromARGB(255, 111, 110, 110),fontSize: 13),),
                ],
              ),
          
            ),
            const Spacer(),
          
            const Padding(
              padding: EdgeInsets.all(17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("OTHERS",style: TextStyle(color: Colors.grey),),
                  SizedBox(height: 20,),
                  Text("Privacy statements",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),)
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){}, child: const Text("RESET"),
                 
                  ),
              ],
            ),
          ],
        ),
      )
   
    );
  }
}