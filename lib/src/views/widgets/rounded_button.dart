import 'package:flutter/material.dart';
import 'package:on_process_button_widget/on_process_button_widget.dart';
import 'package:weather_app/src/views/widgets/size.dart';
import 'package:weather_app/src/views/widgets/svg.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({super.key, this.onPrimary = false, this.onDone, this.onTap, this.svg, this.child, this.margin, this.contentPadding, this.size, this.backgroundColor});
  final bool onPrimary;
  final dynamic Function(bool? _)? onDone;
  final Future<bool?>? Function()? onTap;
  final String? svg;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final double? size;
  final Color? backgroundColor;

  Widget? c() {
    if (svg != null) return CustomSizeBuilder(maxSize: size, child: CustomSVG(svg!, onPrimary: onPrimary));
    if (child != null) return child;

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final double m = t.buttonTheme.height / 2;
    // final double s = m - (m / 8);
    return Container(
      width: size ?? t.buttonTheme.height,
      height: size ?? t.buttonTheme.height,
      margin: margin,
      child: AspectRatio(
        aspectRatio: 1,
        child: OnProcessButtonWidget(
          iconHeight: m,
          contentPadding: contentPadding ?? EdgeInsets.all(m / 8),
          iconColor: onPrimary ? null : Theme.of(context).colorScheme.primary,
          backgroundColor: backgroundColor ?? (onPrimary ? null : Colors.transparent),
          constraints: const BoxConstraints(),
          borderRadius: BorderRadius.circular(m),
          onDone: onDone,
          onTap: onTap,
          child: c(),
        ),
      ),
    );
  }
}
