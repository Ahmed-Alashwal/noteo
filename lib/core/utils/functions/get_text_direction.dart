import 'package:intl/intl.dart';
import 'dart:ui' as ui;

ui.TextDirection? getTextDirection({required String text}) {
  final isRTL = Bidi.detectRtlDirectionality(text);
  return isRTL ? ui.TextDirection.rtl : ui.TextDirection.ltr;
}
