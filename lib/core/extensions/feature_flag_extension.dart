part of '../../feature_flag.dart';

extension FeatureFlagExtension on FeatureFlagInterface {
  Future<bool> isEnabledAsync(Future<void> Function() callback) async {
    bool _enabled = FeatureFlagCore.remoteConfig.getBool(id);
    if(_enabled) await callback.call();
    return _enabled;
  }

  bool isEnabled(void Function() callback) {
    bool _enabled = FeatureFlagCore.remoteConfig.getBool(id);
    if(_enabled) callback.call();
    return _enabled;
  }
}