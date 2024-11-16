import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:rohit_arer_portfolio/constants/app_colors.dart';

class DottedTextButton extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onPressed;

  const DottedTextButton({
    required this.isExpanded,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.lightText, // Dotted border color
      strokeWidth: 1,
      dashPattern: [4, 2], // Dotted pattern: 4 pixels dash, 2 pixels space
      borderType: BorderType.RRect,
      radius: Radius.circular(8),
      padding: EdgeInsets.zero,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: AppColors.lightText,
          padding: const EdgeInsets.symmetric(
              horizontal: 8, vertical: 4), // Text color
        ),
        child: Text(
          isExpanded ? 'Show\nLess...' : 'Show\nMore...',
          style: const TextStyle(
            color: AppColors.lightText,
          ),
        ),
      ),
    );
  }
}
