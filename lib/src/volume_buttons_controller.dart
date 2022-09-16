

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flutter_volume_buttons_service.dart';



typedef VolumeButtons=Function();
class VolumeButtonsController extends StatefulWidget {
  VolumeButtons onVolumeUpPressed;
  VolumeButtons onVolumeDownPressed;
  Widget child;
  VolumeButtonsController({Key? key,required this.onVolumeUpPressed,required this.onVolumeDownPressed,required this.child}) : super(key: key);

  @override
  State<VolumeButtonsController> createState() => _VolumeButtonsControllerState();
}

class _VolumeButtonsControllerState extends State<VolumeButtonsController> {
  static const _volumeBtnChannel = MethodChannel("mychannel");
  StreamSubscription<VolumeButtonEvent>? _volumeButtonStream;
  @override
  void initState() {
    // TODO: implement initState
    if (Platform.isAndroid) {
      _volumeBtnChannel.setMethodCallHandler((call) {

          if (call.method == "volumeBtnPressed") {
            if (call.arguments == "volume_down") {
              widget.onVolumeDownPressed();
            }
            if (call.arguments == "volume_up") {
             widget.onVolumeUpPressed();
            }
          }



        return Future.value(null);
      });
    }
    else if(Platform.isIOS)
      {
        if(volumeButtonEvents!=null)
          {
            volumeButtonEvents!.listen((event) {
              if(event==VolumeButtonEvent.VOLUME_DOWN)
                {
                  widget.onVolumeDownPressed();
                }
              if(event==VolumeButtonEvent.VOLUME_UP)
              {
                widget.onVolumeUpPressed();
              }
            });
          }
      }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
