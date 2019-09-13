package com.baesystems.flutter_plugin

import android.app.Activity
import android.widget.Toast
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterPlugin(channelRef: MethodChannel,activity: Activity) : MethodCallHandler {
    var channel = channelRef
    var activityref = activity

    init {
        this.channel.setMethodCallHandler(this)
    }
    companion object {


        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "flutter_plugin")
            channel.setMethodCallHandler(FlutterPlugin(channel, registrar.activity()))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else if (call.method.equals("showToast")) {
            Toast.makeText(activityref, call.argument<String>("msg"), Toast.LENGTH_SHORT).show()
        } else {
            result.notImplemented()
        }
    }
}
