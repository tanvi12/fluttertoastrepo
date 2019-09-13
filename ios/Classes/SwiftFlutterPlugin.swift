import Flutter
import UIKit

public class SwiftFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
     if(call.method.elementsEqual("showToast")){
        let arguments = call.arguments as? NSDictionary
        let msg = arguments!["msg"] as? String

        UIAlertView(title:"",message:msg,delegate:null,cancelButtonTitle:"OK").show()
     }
    result("iOS " + UIDevice.current.systemVersion)
  }
}
