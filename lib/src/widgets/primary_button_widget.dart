import 'package:flutter/material.dart';
import 'package:flutter_app/src/common/constants/app_colors.dart';
import 'package:flutter_app/src/common/constants/app_ui_helpers.dart';
import 'package:flutter_app/src/presentation/shared/style.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    Key? key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    required this.onPressed,
  }) : super(key: key);

  final String? title;
  final bool disabled;
  final bool busy;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: disabled ? () {} : onPressed,
        child: AnimatedContainer(
          margin: const EdgeInsets.symmetric(vertical: 16),
          duration: defaultAnimationDuration,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: disabled ? kcPrimaryColor : kcPrimaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: !busy
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    title ?? '',
                    style: bodyBoldStyle(kcPrimaryLightTextColor),
                  ),
                )
              : const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(kcWhiteColor),
                  strokeWidth: 8,
                ),
        ),
      ),
    );
  }
}
