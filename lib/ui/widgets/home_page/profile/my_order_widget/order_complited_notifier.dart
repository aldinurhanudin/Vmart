import 'package:flutter/foundation.dart';

class OrderCompletedNotifier extends ValueNotifier<bool> {
  OrderCompletedNotifier() : super(false);

  void markOrderCompleted() {
    value = true;
  }
}
