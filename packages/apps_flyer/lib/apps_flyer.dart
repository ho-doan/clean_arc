import 'apps_flyer_platform_interface.dart';
import 'src/generated/apps_flyer.pb.dart';

export 'src/widgets/web_view.dart';
export 'src/generated/apps_flyer.pb.dart';

class AppsFlyer {
  const AppsFlyer._();
  static const instance = AppsFlyer._();
  Future<void> init(String appFlyerToken) => AppsFlyerPlatform.instance
      .init(ModelAppFlyer(values: {'appFlyerToken': appFlyerToken}));
  Future<bool> hasInit() => AppsFlyerPlatform.instance.hasInit();

  Future<void> enableDebugLog() => AppsFlyerPlatform.instance.enableDebugLog();

  Future<void> disableDebugLog() =>
      AppsFlyerPlatform.instance.disableDebugLog();

  Future<void> setCustomerIdAndLogSession(Map<String, String> values) =>
      AppsFlyerPlatform.instance
          .setCustomerIdAndLogSession(ModelAppFlyer(values: values));

  Future<void> setCustomerUserId(Map<String, String> values) =>
      AppsFlyerPlatform.instance
          .setCustomerUserId(ModelAppFlyer(values: values));

  Future<void> logEvent(Map<String, String> values) =>
      AppsFlyerPlatform.instance.logEvent(ModelAppFlyer(values: values));
  Future<void> start(String appFlyerToken) => AppsFlyerPlatform.instance
      .start(ModelAppFlyer(values: {'appFlyerToken': appFlyerToken}));
}
