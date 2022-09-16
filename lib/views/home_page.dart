import 'package:flutter/material.dart';
import 'package:volume_button_test/src/volume_buttons_controller.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: VolumeButtonsController(
        onVolumeDownPressed: (){
          counter--;
          setState(() {

          });
        },
        onVolumeUpPressed: (){
          counter++;
          setState(() {

          });
        },
        child: Container(
          child: Center(
            child: Text("$counter"),
          ),
        ),
      ),
    );
  }
}
