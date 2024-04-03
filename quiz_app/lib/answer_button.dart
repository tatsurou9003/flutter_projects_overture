import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          side: const BorderSide(color: Colors.green, width: 2.0),
          backgroundColor: Colors.black,
          foregroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
