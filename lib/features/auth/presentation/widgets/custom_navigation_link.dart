import 'package:flutter/material.dart';
import 'package:note_app/core/constants/text_style.dart';
import 'package:note_app/core/widgets/custom_hyper_link_text.dart';

class CustomNavigationLink extends StatelessWidget {
  final String text;
  final String hyperLinkText;
  final Widget destination;

  const CustomNavigationLink({
    super.key,
    required this.text,
    required this.hyperLinkText,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: AppTextStyles.verySmall10Regular),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          },
          child: CustomHyperLinkText(hyperLinkText: hyperLinkText),
        ),
      ],
    );
  }
}
