package com.hodoan.apps_flyer.common

import android.annotation.SuppressLint
import android.content.Context
import android.os.Looper
import android.view.View
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.webkit.WebViewClient
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class NativeViewFactory(private val message: BinaryMessenger) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(
        context: Context,
        viewId: Int,
        args: Any?,
    ): PlatformView {
        @Suppress("UNCHECKED_CAST") val creationParams = args as Map<String?, Any?>?
        return AppFlyerWebView(context, viewId, creationParams, message)
    }
}


@SuppressLint("SetJavaScriptEnabled")
internal class AppFlyerWebView(
    context: Context,
    id: Int,
    creationParams: Map<String?, Any?>?,
    message: BinaryMessenger
) : PlatformView {
    private val channel: MethodChannel

    private val webView: WebView

    override fun getView(): View {
        return webView
    }

    override fun dispose() {

    }

    init {
        channel = MethodChannel(message, "app_flyer_web_view_$id")
        webView = WebView(context)
        webView.webViewClient = WebViewClient()
        webView.settings.javaScriptEnabled = true
        webView.settings.domStorageEnabled = true
        webView.addJavascriptInterface(
            MyJavaScriptInterface(channel),
            creationParams?.get("appClientKey") as String
        )

        webView.loadUrl(creationParams["url"] as String)
    }
}

class MyJavaScriptInterface(private val channel: MethodChannel) {
    @JavascriptInterface
    fun appsFlyerEvent(data: String) {
        android.os.Handler(Looper.getMainLooper()).post {
            channel.invokeMethod("appsFlyerEvent", data)
        }
        //TODO hodoan send data to flutter
//        val gson = Gson()
//        val mapType = object : TypeToken<Map<String, String>>() {}.type
//        val map: Map<String, String> = gson.fromJson(data, mapType)
//        val uid = a["uid"]
//        val eventType = map["event_type"]

//        AppsFlyerLib.getInstance().setCustomerUserId(uid)
//        AppsFlyerLib.getInstance().setCustomerIdAndLogSession(uid, context)
//        AppsFlyerLib.getInstance().logEvent(context, eventType, map)
    }
}