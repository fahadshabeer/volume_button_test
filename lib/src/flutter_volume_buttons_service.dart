
import 'dart:async';

import 'package:flutter/services.dart';

const _VOLUME_BUTTON_CHANNEL_NAME = 'flutter.moum.hardware_buttons.volume';
const _HOME_BUTTON_CHANNEL_NAME = 'flutter.moum.hardware_buttons.home';
const _LOCK_BUTTON_CHANNEL_NAME = 'flutter.moum.hardware_buttons.lock';

const EventChannel _volumeButtonEventChannel =
EventChannel(_VOLUME_BUTTON_CHANNEL_NAME);
const EventChannel _homeButtonEventChannel =
EventChannel(_HOME_BUTTON_CHANNEL_NAME);
const EventChannel _lockButtonEventChannel =
EventChannel(_LOCK_BUTTON_CHANNEL_NAME);

enum VolumeButtonEvent {
  /// Volume Up button event
  VOLUME_UP,

  /// Volume Down button event
  VOLUME_DOWN,
}

 Stream<VolumeButtonEvent>? _volumeButtonEvents;

/// A broadcast stream of volume button events
Stream<VolumeButtonEvent>? get volumeButtonEvents {
  _volumeButtonEvents ??= _volumeButtonEventChannel
        .receiveBroadcastStream()
        .map((dynamic event) => _eventToVolumeButtonEvent(event));
  return _volumeButtonEvents;
}

VolumeButtonEvent _eventToVolumeButtonEvent(dynamic event) {
  if (event == 24) {
    return VolumeButtonEvent.VOLUME_UP;
  } else if (event == 25) {
    return VolumeButtonEvent.VOLUME_DOWN;
  } else {
    throw Exception('Invalid volume button event');
  }
}