
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/utils/coloors.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20
      ),

      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Read our ',
          style: TextStyle(
            color: context.theme.greyColor,
            height: 1.5,
          ),

          children: [
            TextSpan(
              text: 'Private Policy. ',
              style: TextStyle(
                color: context.theme.blueColor,
              ),
            ),

            const TextSpan(
              text: 'Tap "Agree and continue" to accept the ',
            ),

            TextSpan(
              text: 'Terms of Services.',
              style: TextStyle(
                color: context.theme.blueColor,
              ),

            ),
          ],
        ),
      ),
    );
  }
}