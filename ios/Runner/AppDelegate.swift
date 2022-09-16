import UIKit
import Flutter

enum ChannelName {
    static let volume = "flutter.moum.hardware_buttons.volume"
    static let home = "flutter.moum.hardware_buttons.home"
    static let lock = "flutter.moum.hardware_buttons.lock"
}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
     // VolumeButton
            let volumeInstance = VolumeButtenStreamHandler()
            let volumeStream = FlutterEventChannel(name: ChannelName.volume,
                                                   binaryMessenger: registrar.messenger())
            volumeStream.setStreamHandler(volumeInstance)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
