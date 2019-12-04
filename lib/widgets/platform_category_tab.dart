import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/theme.dart';
import 'package:flutter_app/widgets/platform_widget.dart';


class PlatformTabs extends PlatformWidget<Text, Tab> {
  final label;

  PlatformTabs({this.label});

  @override
  Tab createAndroidWidget(BuildContext context) {
    return Tab(
        child: Text(
      label,
      style: TextStyle(color: VoiceTheme.blaze_orange),
    ));
  }

  @override
  Text createIosWidget(BuildContext context) {
    return Text(label);
  }
}
