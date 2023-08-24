import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback action;
  final BuildContext? context;
  final String label;
  final double? paddingtop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;

  const AppButton(
      {super.key,
      required this.action,
      this.context,
      required this.label,
      this.paddingtop,
      this.paddingBottom,
      this.paddingLeft,
      this.paddingRight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: paddingBottom ?? 0,
          top: paddingtop ?? 0,
          right: paddingRight ?? 0,
          left: paddingLeft ?? 0),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: action,
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            backgroundColor: Colors.green,
            foregroundColor: Colors.green,
            padding: const EdgeInsets.all(12),
            surfaceTintColor: Colors.green,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
