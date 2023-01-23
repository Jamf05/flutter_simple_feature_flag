part of '../feature_flag.dart';

class FeatureFlagCore {
  static final FeatureFlagCore _instance = FeatureFlagCore._internal();
  FeatureFlagCore._internal();

  static Future<FeatureFlagCore> init({
    required FirebaseRemoteConfig remoteConfig,
    RemoteConfigSettings? remoteConfigSettings,
  }) async {
    _remoteConfig = remoteConfig;
    if (remoteConfigSettings != null) {
      await remoteConfig.setConfigSettings(remoteConfigSettings);
    }
    await remoteConfig.fetchAndActivate();
    return _instance;
  }

  static late FirebaseRemoteConfig _remoteConfig;
  static FirebaseRemoteConfig get remoteConfig => _remoteConfig;
}
