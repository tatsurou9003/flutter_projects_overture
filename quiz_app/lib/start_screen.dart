import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(255, 90, 242, 179),
          ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter the fun way',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 100, 223, 172),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 116, 238, 187),
                side: const BorderSide(
                  color: Color.fromARGB(255, 119, 241, 190),
                  width: 2.0,
                )),
            child: const Text(
              'Start Quiz',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
