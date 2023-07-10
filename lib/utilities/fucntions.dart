import 'package:flutter/services.dart';

showBottomNavRail(bool valueBool) {
  if (valueBool) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      // overlays: [
      //   SystemUiOverlay.bottom,
      // ],
    );
  } else {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
      ],
    );
  }
}
