import 'package:apps_flyer/src/generated/apps_flyer.pb.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'apps_flyer_platform_interface.dart';

/// An implementation of [AppsFlyerPlatform] that uses method channels.
class MethodChannelAppsFlyer extends AppsFlyerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('apps_flyer');

  @override
  Future<void> init(ModelAppFlyer model) =>
      methodChannel.invokeMethod('init', model.writeToBuffer());

  @override
  Future<void> enableDebugLog() => methodChannel.invokeMethod('enableDebugLog');

  @override
  Future<void> disableDebugLog() =>
      methodChannel.invokeMethod('disableDebugLog');

  @override
  Future<void> setCustomerIdAndLogSession(ModelAppFlyer model) => methodChannel
      .invokeMethod('setCustomerIdAndLogSession', model.writeToBuffer());

  @override
  Future<void> setCustomerUserId(model) =>
      methodChannel.invokeMethod('setCustomerUserId', model.writeToBuffer());

  @override
  Future<void> logEvent(ModelAppFlyer model) =>
      methodChannel.invokeMethod('logEvent', model.writeToBuffer());

  @override
  Future<void> start(ModelAppFlyer model) =>
      methodChannel.invokeMethod('start', model.writeToBuffer());

  @override
  Future<bool> hasInit() async =>
      (await methodChannel.invokeMethod('hasInit')) ?? false;
}
