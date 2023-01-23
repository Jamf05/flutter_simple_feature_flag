part of '../../feature_flag.dart';

class MultiFeatureFlagWidget<T> extends StatelessWidget {
  final List<FeatureFlagInterface> flags;
  final Widget child;
  final Widget? offWidget;
  final Widget? loadingWidget;
  const MultiFeatureFlagWidget({
    Key? key,
    required this.flags,
    required this.child,
    this.offWidget,
    this.loadingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _toggleByCondition();
  }

  Widget _toggleByCondition() {
    if (flags.isEmpty) return child;
    final list = List<bool>.generate(
      flags.length,
      (i) {
        final _toggle = FeatureFlagCore.remoteConfig.getBool(flags[i].id);
        return _toggle;
      },
    );

    final test = list.every((v) => !v);

    return test ? (offWidget ?? const SizedBox()) : child;
  }
}
