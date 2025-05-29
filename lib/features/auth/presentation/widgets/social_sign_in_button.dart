import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:road_wise/app/theme/app_theme.dart';

class SocialSignInButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;
  final String? label;

  const SocialSignInButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: label != null ? null : 56,
        height: 56,
        padding: EdgeInsets.symmetric(
          horizontal: label != null ? 24 : 0,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppTheme.lightColor
              : const Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade300
                : Colors.grey.shade800,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
            ),
            if (label != null) ...[
              const SizedBox(width: 12),
              Text(
                label!,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
