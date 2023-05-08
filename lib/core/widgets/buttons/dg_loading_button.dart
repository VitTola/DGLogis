import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/widgets/buttons/dg_button.dart';

///Recommended used with an async function.
///If no aysnc func, use DGButton instead.
class ExLoadingButton extends StatefulWidget {
  const ExLoadingButton(this.text,
      {Key? key,
      required this.onTap,
      this.controller,
      this.variant = ButtonVariant.text,
      this.startIcon,
      this.endIcon,
      this.paddingVertical = 4,
      this.paddingHorizone = 8,
      this.loadingSize = 24,
      this.enable = true})
      : super(key: key);

  final Widget text;

  final ButtonVariant variant;
  final Widget? startIcon;
  final Widget? endIcon;

  final double paddingVertical;
  final double paddingHorizone;

  final double? loadingSize;

  final Future<void> Function() onTap;
  final ButtonController? controller;
  final bool enable;

  @override
  State<ExLoadingButton> createState() => _ExLoadingButtonState();
}

class _ExLoadingButtonState extends State<ExLoadingButton> {
  final ValueNotifier<bool> _btnState = ValueNotifier(false);

  @override
  void initState() {
    widget.controller?.requestInvokeOnPress = _onTap;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ExLoadingButton oldWidget) {
    // Re-assign, due to reload page issue
    widget.controller?.requestInvokeOnPress ??= _onTap;

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _btnState,
      builder: (context, isRunning, child) {
        Widget? runningEndIcon = widget.endIcon;
        if (widget.endIcon != null && isRunning) {
          runningEndIcon = SizedBox(
              width: widget.loadingSize,
              height: widget.loadingSize,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: widget.variant == ButtonVariant.filled
                      ? Theme.of(context).colorScheme.onPrimary
                      : null,
                ),
              ));
        }

        Widget? runningText = widget.text;
        if (widget.endIcon == null && isRunning) {
          runningText = SizedBox(
              width: widget.loadingSize,
              height: widget.loadingSize,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: widget.variant == ButtonVariant.filled
                      ? Theme.of(context).colorScheme.onPrimary
                      : null,
                ),
              ));
        }

        return DGButton(
          _ContentAnimatedSwitcher(child: runningText),
          endIcon: runningEndIcon != null
              ? _ContentAnimatedSwitcher(child: runningEndIcon)
              : null,
          key: widget.key,
          variant: widget.variant,
          startIcon: widget.startIcon,
          paddingVertical: widget.paddingVertical,
          paddingHorizone: widget.paddingHorizone,
          onTap: widget.enable ? _onTap : null,
        );
      },
    );
  }

  void _onTap() {
    if (_btnState.value == true) return;

    _btnState.value = true;
    try {
      widget.onTap().whenComplete(() {
        _btnState.value = false;
      }).onError((error, stackTrace) {
        _btnState.value = false;
      });
    } catch (e) {
      _btnState.value = false;
      rethrow;
    }
  }
}

class _ContentAnimatedSwitcher extends StatelessWidget {
  const _ContentAnimatedSwitcher({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        key: key,
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (xchild, animation) {
          final offsetAnimation = TweenSequence([
            TweenSequenceItem(
              tween: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: const Offset(0.0, 0.0),
              ),
              weight: 1,
            ),
          ]).animate(animation);
          return ClipRRect(
            child: SlideTransition(
              position: offsetAnimation,
              child: xchild,
            ),
          );
        },
        child: child);
  }
}

class ButtonController {
  /// Called when called `pause` method
  void Function()? requestInvokeOnPress;

  ///
  /// Constructor
  ///
  ButtonController([this.requestInvokeOnPress]);
}
