import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPlugin {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<Null> showToast(String msg) async{
    var args = Map<String,dynamic>();
    args.putIfAbsent("msg", ()=>msg);
    await _channel.invokeMethod("showToast",args);
    return null;
  }
}
