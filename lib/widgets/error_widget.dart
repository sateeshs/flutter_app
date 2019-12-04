import 'package:flutter/widgets.dart';
import 'package:flutter_app/common/strings.dart';

import 'platform_button.dart';


class ContentErrorWidget extends StatelessWidget {
  final onTryAgain;

  ContentErrorWidget({this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(32.0),
          child: Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                Strings.label_error_loading_content,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              )
            ),
        ),
        PlatformButton(
          onPressed: this.onTryAgain,
        )
      ],
    );
  }
}
