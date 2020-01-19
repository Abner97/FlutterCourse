package com.example.calling_kotlin_code

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.flutter.epic/epic"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {methodCall, result ->
        val arguments = methodCall.arguments<Map<String, Any>>()

        if(methodCall.method=="Printy"){
            var val1 = arguments["val1"]
            if(val1 == "1"){
                result.success("Chingon!")
            }else{
                result.success("Nosky")
            }
        }
    }
    }
}
