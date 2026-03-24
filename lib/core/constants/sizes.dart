import 'package:flutter/material.dart';

abstract class AppSizes {
  // 1. Raw Numeric Values (The Foundation)
  static const double p4 = 4.0;
  static const double p8 = 8.0;
  static const double p12 = 12.0;
  static const double p16 = 16.0;
  static const double p20 = 20.0;
  static const double p24 = 24.0;
  static const double p32 = 32.0;
  static const double p40 = 40.0;
  static const double p48 = 48.0;

  // 2. Vertical Spacing (For Columns)
  static const gapH4 = SizedBox(height: p4);
  static const gapH8 = SizedBox(height: p8);
  static const gapH12 = SizedBox(height: p12);
  static const gapH16 = SizedBox(height: p16);
  static const gapH24 = SizedBox(height: p24);
  static const gapH32 = SizedBox(height: p32);

  // 3. Horizontal Spacing (For Rows)
  static const gapW4 = SizedBox(width: p4);
  static const gapW8 = SizedBox(width: p8);
  static const gapW12 = SizedBox(width: p12);
  static const gapW16 = SizedBox(width: p16);
  static const gapW24 = SizedBox(width: p24);
  static const gapW32 = SizedBox(width: p32);

  // 4. Border Radius
  static final r4 = BorderRadius.circular(p4);
  static final r8 = BorderRadius.circular(p8);
  static final r12 = BorderRadius.circular(p12);
  static final r16 = BorderRadius.circular(p16);
  static final r24 = BorderRadius.circular(p24);
  static const rMax = BorderRadius.all(Radius.circular(999));

  // 5. Common Padding Sets
  static const pAll4 = EdgeInsets.all(p4);
  static const pAll8 = EdgeInsets.all(p8);
  static const pAll12 = EdgeInsets.all(p12);
  static const pAll16 = EdgeInsets.all(p16);

  // Specific screen-edge padding (Very useful!)
  static const pScreen = EdgeInsets.symmetric(horizontal: p16, vertical: p8);
  static const pH16 = EdgeInsets.symmetric(horizontal: p16);
  static const pH12 = EdgeInsets.symmetric(horizontal: p12);
  static const pH8 = EdgeInsets.symmetric(horizontal: p8);
  static const pH4 = EdgeInsets.symmetric(horizontal: p4);
  static const pV16 = EdgeInsets.symmetric(vertical: p16);
  static const pV12 = EdgeInsets.symmetric(vertical: p12);
  static const pV8 = EdgeInsets.symmetric(vertical: p8);
  static const pV4 = EdgeInsets.symmetric(vertical: p4);

  // 6. Icon & Image Sizes
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double logoSize = 120.0;
}
