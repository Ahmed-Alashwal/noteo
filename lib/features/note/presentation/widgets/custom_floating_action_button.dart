import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/core/constants/colors.dart';
import 'package:note_app/core/constants/strings.dart';
import 'package:note_app/features/note/presentation/screens/create_note_screen.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.bgWhite,
            blurRadius: 16,
            offset: Offset(1, 1),
            spreadRadius: -5,
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateNoteScreen()),
          );
        },
        elevation: 0,
        backgroundColor: AppColors.bgPrimary,
        splashColor: AppColors.bgPrimary,
        child: SvgPicture.asset(AppString.kPen, width: 20, height: 20),
      ),
    );
  }
}
