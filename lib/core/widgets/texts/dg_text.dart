import 'package:flutter/material.dart';
import 'package:skailab_dg_logis_app/core/shared/utils.dart';

enum DgTextType { caption, body, bodyMeduim, title, titleMeduim, header }

class DgText extends StatelessWidget {
  final String? value;
  final double? size;
  final bool bold;
  final bool primary;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final bool underline;
  final bool softWrap;
  final double? height;
  final String? font;
  final bool droppedShadow;
  final bool copiable;
  final String? valueToCopy;
  final DgTextType type;

  const DgText(this.value,
      {Key? key,
      this.size,
      this.bold = false,
      this.primary = false,
      this.color,
      this.maxLines,
      this.overflow,
      this.textAlign,
      this.letterSpacing,
      this.underline = false,
      this.softWrap = true,
      this.height,
      this.font,
      this.droppedShadow = false,
      this.copiable = false,
      this.valueToCopy,
      this.type = DgTextType.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(
      fontWeight: bold ? FontWeight.bold : null,
      color: primary ? Theme.of(context).colorScheme.primary : color,
      letterSpacing: letterSpacing,
      decoration: underline ? TextDecoration.underline : null,
      height: height,
      fontFamily: font,
      shadows: droppedShadow
          ? <Shadow>[
              Shadow(
                offset: const Offset(1.0, 1.0),
                blurRadius: 10.0,
                color: Theme.of(context).cardColor,
              ),
            ]
          : null,
    );
    style = _getTextStyleByType(type, style);
    if (size != null) {
      style = style.copyWith(fontSize: size);
    }

    if (copiable) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (value != null) {
              copyTextToClipboard(context, valueToCopy ?? value!);
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              color: Colors.grey.withOpacity(.1),
              child: Text(
                value ?? "",
                style: style,
                maxLines: maxLines,
                overflow: overflow,
                textAlign: textAlign,
                softWrap: softWrap,
              ),
            ),
          ),
        ),
      );
    }

    return Text(
      value ?? "",
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }

  TextStyle _getTextStyleByType(DgTextType type, TextStyle old) {
    switch (type) {
      case DgTextType.caption:
        return old.copyWith(fontSize: 14);
      case DgTextType.body:
        return old.copyWith(fontSize: 16);
      case DgTextType.bodyMeduim:
        return old.copyWith(fontSize: 20);
      case DgTextType.title:
        return old.copyWith(fontSize: 20, fontWeight: FontWeight.w600);
      case DgTextType.titleMeduim:
        return old.copyWith(fontSize: 20, fontWeight: FontWeight.bold);
      case DgTextType.header:
        return old.copyWith(fontSize: 24, fontWeight: FontWeight.bold);
      default:
        return old.copyWith(fontSize: 14);
    }
  }
}
