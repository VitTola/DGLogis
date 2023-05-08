import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DGButton extends StatelessWidget {
  final Widget? text;
  final void Function()? onTap;
  final ButtonVariant variant;
  final Widget? startIcon;
  final Widget? endIcon;

  final double paddingVertical;
  final double paddingHorizone;

  late Color? backgroundColor;

  DGButton(
    this.text, {
    Key? key,
    this.onTap,
    this.variant = ButtonVariant.text,
    this.startIcon,
    this.endIcon,
    this.paddingVertical = 4,
    this.paddingHorizone = 8,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    backgroundColor = backgroundColor ?? Theme.of(context).colorScheme.primary;

    if (variant == ButtonVariant.elevated) {
      return ElevatedButton(
        onPressed: onTap,
        child: _content(context),
      );
    }

    if (variant == ButtonVariant.filled) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          // Foreground color
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          // Background color
          backgroundColor: backgroundColor,
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
        onPressed: onTap,
        child: _content(context),
      );
    }

    if (variant == ButtonVariant.cancel) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          // Foreground color
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          // Background color
          backgroundColor: Theme.of(context).colorScheme.error.withOpacity(.8),
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
        onPressed: onTap,
        child: _content(context),
      );
    }

    if (variant == ButtonVariant.round) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          // No elevation
          elevation: 0.0,
          // padding: EdgeInsets.only(
          //   top: paddingHorizone,
          //   bottom: paddingHorizone,
          //   left: paddingVertical,
          //   right: paddingVertical,
          // ),
          backgroundColor: backgroundColor,
        ),
        onPressed: onTap,
        child: _content(context),
      );
    }

    if (variant == ButtonVariant.filledTonal) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          // Foreground color
          foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          // Background color
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
        onPressed: onTap,
        child: _content(context),
      );
    }

    if (variant == ButtonVariant.outline) {
      return OutlinedButton(
        onPressed: onTap,
        child: _content(context),
      );
    }

    return TextButton(onPressed: onTap, child: _content(context));
  }

  Widget _content(BuildContext context) {
    if (startIcon == null && endIcon == null) {
      return Padding(
        padding: EdgeInsets.symmetric(
            vertical: paddingVertical, horizontal: paddingHorizone),
        child: text,
      );
    } else if (startIcon != null && endIcon != null) {
      return Padding(
        padding: EdgeInsets.symmetric(
            vertical: paddingVertical, horizontal: paddingHorizone),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            startIcon!,
            const SizedBox(
              width: 4,
            ),
            text ?? const SizedBox.shrink(),
            const SizedBox(
              width: 4,
            ),
            endIcon!
          ],
        ),
      );
    }
    if (startIcon != null) {
      return Padding(
        padding: EdgeInsets.symmetric(
            vertical: paddingVertical, horizontal: paddingHorizone),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            startIcon!,
            text != null
                ? Row(
                    children: [
                      const SizedBox(
                        width: 4,
                      ),
                      text!,
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: paddingVertical, horizontal: paddingHorizone),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          text != null
              ? Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    text!,
                  ],
                )
              : const SizedBox.shrink(),
          endIcon!,
        ],
      ),
    );
  }
}

enum ButtonVariant {
  elevated,
  filled,
  filledTonal,
  outline,
  cancel,
  text,
  round
}
