import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function(BuildContext) action;
  final String label;

  const PrimaryButton({
    Key? key,
    required this.action,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        action(context);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
