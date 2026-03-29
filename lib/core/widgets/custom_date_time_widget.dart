import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/core/constants/colors.dart';

class CustomDateTimeWidget extends StatelessWidget {
  final DateTime updatedtime;
  const CustomDateTimeWidget({super.key, required this.updatedtime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        DateFormat('h:mm a | yyyy-M-dd').format(updatedtime),
        style: TextStyle(color: AppColors.textPrimary, fontSize: 10),
      ),
    );
  }
}
