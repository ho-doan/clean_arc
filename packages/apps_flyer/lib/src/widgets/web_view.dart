import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const String viewType = 'app_flyer_web_view';

class AppFlyerWebView extends StatefulWidget {
  const AppFlyerWebView({
    super.key,
    required this.url,
    required this.appClientKey,
    required this.callback,
  });
  final String url;
  final String appClientKey;

  final void Function(Map<String, String>) callback;

  @override
  State<AppFlyerWebView> createState() => _AppFlyerWebViewState();
}

class _AppFlyerWebViewState extends State<AppFlyerWebView> {
  MethodChannel? channel;

  late Map<String, dynamic> creationParams;

  @override
  void initState() {
    creationParams = <String, dynamic>{
      'url': widget.url,
      'appClientKey': widget.appClientKey,
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AndroidView(
      onPlatformViewCreated: (id) {
        channel = MethodChannel('app_flyer_web_view_$id')
          ..setMethodCallHandler(_handle);
      },
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }

  Future _handle(MethodCall call) async {
    switch (call.method) {
      case 'appsFlyerEvent':
        {
          final js =
              (jsonDecode(call.arguments as String) as Map<String, dynamic>);
          final json = {for (final e in js.entries) e.key: e.value.toString()};
          widget.callback.call(json);
        }
    }
  }
}
