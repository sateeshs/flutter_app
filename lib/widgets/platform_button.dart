import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/strings.dart';
import 'package:flutter_app/common/theme.dart';
import 'package:flutter_app/widgets/platform_widget.dart';


class PlatformButton extends PlatformWidget<CupertinoButton, MaterialButton> {
  final onPressed;

  PlatformButton({this.onPressed});

  @override
  MaterialButton createAndroidWidget(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: VoiceTheme.blaze_orange,
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            Strings.label_try_again,
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  @override
  CupertinoButton createIosWidget(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      color: VoiceTheme.blaze_orange,
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            Strings.label_try_again,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
