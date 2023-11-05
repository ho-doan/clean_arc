// import 'package:flutter_test/flutter_test.dart';
// import 'package:apps_flyer/apps_flyer.dart';
// import 'package:apps_flyer/apps_flyer_platform_interface.dart';
// import 'package:apps_flyer/apps_flyer_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockAppsFlyerPlatform
//     with MockPlatformInterfaceMixin
//     implements AppsFlyerPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final AppsFlyerPlatform initialPlatform = AppsFlyerPlatform.instance;

//   test('$MethodChannelAppsFlyer is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelAppsFlyer>());
//   });

//   test('getPlatformVersion', () async {
//     AppsFlyer appsFlyerPlugin = AppsFlyer();
//     MockAppsFlyerPlatform fakePlatform = MockAppsFlyerPlatform();
//     AppsFlyerPlatform.instance = fakePlatform;

//     expect(await appsFlyerPlugin.getPlatformVersion(), '42');
//   });
// }
