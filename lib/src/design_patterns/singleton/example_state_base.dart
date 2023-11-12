import 'package:flutter/foundation.dart';

base class ExampleStateBase {
  @protected
  late String initialText;
  @protected
  late String stateText;

  String get currentText => '$stateText\nHashcode: $hashCode';

  void setStateText(String text) => stateText = text;

  void reset() {
    stateText = initialText;
  }
}
