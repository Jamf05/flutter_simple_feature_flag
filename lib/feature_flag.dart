library feature_flag;

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'core/feature_flag_interface.dart';

export 'core/feature_flag_interface.dart';

part 'core/feature_flag_core.dart';
part 'core/widget/feature_flag_widget.dart';
part 'core/widget/multi_feature_flag_widget.dart';
part 'core/extensions/feature_flag_extension.dart';