part of '../../feature_flag.dart';

class FeatureFlagWidget extends StatelessWidget {
  final FeatureFlagInterface flag;
  final Widget child;
  final Widget? offWidget;
  final Widget? loadingWidget;
  final double opacity;
  const FeatureFlagWidget({
    Key? key,
    required this.flag,
    required this.child,
    this.offWidget,
    this.loadingWidget,
    this.opacity = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _toggleByCondition();
  }

  Widget _toggleByCondition() {
    final _toggle = FeatureFlagCore.remoteConfig.getBool(
      flag.id,
    );
    return _toggle == true ? child : offWidget ?? const SizedBox();
  }

  static Widget? isEnabled(
      {@required FeatureFlagInterface? flag,
      required Widget child,
      Widget? offWidget,
      double opacity = 0.5}) {
    if (flag == null) return child;
    final _toggle = FeatureFlagCore.remoteConfig.getBool(flag.id);
    bool _enabled = _toggle == true;
    if (_enabled) {
      return _toggle == true ? child : offWidget ?? const SizedBox();
    }
    return null;
  }
}
