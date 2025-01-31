import 'package:flutter/material.dart';
import 'package:news_x/shared/app_theme.dart';

class SourceItem extends StatelessWidget {
  const SourceItem(
      {super.key, required this.sourceName, required this.isSelected});

  final String sourceName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primary : AppTheme.white,
        border: Border.all(color: AppTheme.primary, width: 2),
        borderRadius: BorderRadius.circular(24),
      ),
      alignment: Alignment.center,
      child: Text(
        sourceName,
        style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? AppTheme.white : AppTheme.primary),
      ),
    );
  }
}
