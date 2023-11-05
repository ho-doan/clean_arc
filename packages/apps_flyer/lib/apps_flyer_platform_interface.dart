import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'apps_flyer_method_channel.dart';
import 'src/generated/apps_flyer.pb.dart';

abstract class AppsFlyerPlatform extends PlatformInterface {
  /// Constructs a AppsFlyerPlatform.
  AppsFlyerPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppsFlyerPlatform _instance = MethodChannelAppsFlyer();

  /// The default instance of [AppsFlyerPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppsFlyer].
  static AppsFlyerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppsFlyerPlatform] when
  /// they register themselves.
  static set instance(AppsFlyerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> init(ModelAppFlyer model) {
    throw UnimplementedError('init() has not been implemented');
  }

  Future<bool> hasInit() {
    throw UnimplementedError('hasInit() has not been implemented');
  }

  Future<void> enableDebugLog() {
    throw UnimplementedError('enableDebugLog() has not been implemented');
  }

  Future<void> disableDebugLog() {
    throw UnimplementedError('disableDebugLog() has not been implemented');
  }

  Future<void> start(ModelAppFlyer model) {
    throw UnimplementedError('start() has not been implemented');
  }

  Future<void> setCustomerUserId(ModelAppFlyer model) {
    throw UnimplementedError('setCustomerUserId() has not been implemented');
  }

  Future<void> setCustomerIdAndLogSession(ModelAppFlyer model) {
    throw UnimplementedError(
        'setCustomerIdAndLogSession() has not been implemented');
  }

  Future<void> logEvent(ModelAppFlyer model) {
    throw UnimplementedError('logEvent() has not been implemented');
  }
}
