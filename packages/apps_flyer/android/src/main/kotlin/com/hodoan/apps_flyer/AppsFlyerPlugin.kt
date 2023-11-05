package com.hodoan.apps_flyer

import android.app.Activity
import android.util.Log
import com.appsflyer.AppsFlyerLib
import com.appsflyer.attribution.AppsFlyerRequestListener
import com.hodoan.apps_flyer.common.NativeViewFactory
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AppsFlyerPlugin */
class AppsFlyerPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private lateinit var activity: Activity

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "apps_flyer")
        channel.setMethodCallHandler(this)
        binding
            .platformViewRegistry
            .registerViewFactory("app_flyer_web_view", NativeViewFactory(binding.binaryMessenger))
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "init" -> init(result, call)
            "hasInit" -> result.success(this::activity.isInitialized)
            "enableDebugLog" -> enableDebugLog(result)
            "disableDebugLog" -> disableDebugLog(result)
            "start" -> start(result, call)
            "setCustomerUserId" -> setCustomerUserId(result, call)
            "setCustomerIdAndLogSession" -> setCustomerIdAndLogSession(result, call)
            "logEvent" -> logEvent(result, call)
            else -> result.notImplemented()
        }
    }

    private fun init(result: Result, call: MethodCall) {
        val model = ProtobufModel.ModelAppFlyer.parseFrom(call.arguments as ByteArray)
        val appFlyerToken = model.getValuesOrThrow("appFlyerToken")
        AppsFlyerLib.getInstance().init(appFlyerToken, null, activity)
        result.success(null)
    }

    private fun setCustomerUserId(result: Result, call: MethodCall) {
        val model = ProtobufModel.ModelAppFlyer.parseFrom(call.arguments as ByteArray)
        val uid = model.getValuesOrThrow("uid")
        AppsFlyerLib.getInstance().setCustomerUserId(uid)
        result.success(null)
    }

    private fun setCustomerIdAndLogSession(result: Result, call: MethodCall) {
        val model = ProtobufModel.ModelAppFlyer.parseFrom(call.arguments as ByteArray)
        val uid = model.getValuesOrThrow("uid")
        AppsFlyerLib.getInstance().setCustomerIdAndLogSession(uid, activity.applicationContext)
        result.success(null)
    }

    private fun logEvent(result: Result, call: MethodCall) {
        val model = ProtobufModel.ModelAppFlyer.parseFrom(call.arguments as ByteArray)
        val eventType = model.getValuesOrThrow("event_type")
        AppsFlyerLib.getInstance()
            .logEvent(activity.applicationContext, eventType, model.valuesMap as Map<String, Any>)
        result.success(null)
    }

    private fun enableDebugLog(result: Result) {
        AppsFlyerLib.getInstance().setDebugLog(true)
        result.success(null)
    }

    private fun disableDebugLog(result: Result) {
        AppsFlyerLib.getInstance().setDebugLog(false)
        result.success(null)
    }

    private fun start(result: Result, call: MethodCall) {
        val model = ProtobufModel.ModelAppFlyer.parseFrom(call.arguments as ByteArray)
        val appFlyerToken = model.getValuesOrThrow("appFlyerToken")
        AppsFlyerLib.getInstance()
            .start(activity, appFlyerToken, object : AppsFlyerRequestListener {
                override fun onSuccess() {
                    Log.d("Dev", "Launch sent successfully")
                }

                override fun onError(errorCode: Int, errorDesc: String) {
                    Log.d(
                        "Dev", "Launch failed to be sent:\n" +
                                "Error code: " + errorCode + "\n"
                                + "Error description: " + errorDesc
                    )
                }
            })
        result.success(null)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {

    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {

    }

    override fun onDetachedFromActivity() {

    }
}
