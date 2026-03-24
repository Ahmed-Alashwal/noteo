import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/core/constants/colors.dart';

class CustomDateTimeWidget extends StatelessWidget {
  CustomDateTimeWidget({super.key});

  final date = DateFormat('yyyy-M-dd').format(DateTime.now());
  final time = DateFormat('h:mm a').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        '$time | $date',
        style: TextStyle(color: AppColors.textPrimary, fontSize: 10),
      ),
    );
  }
}
