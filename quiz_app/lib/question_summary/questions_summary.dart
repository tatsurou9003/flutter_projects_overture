import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color.fromARGB(255, 52, 255, 218),
            width: 2,
          )),
      child: SizedBox(
        height: 420,
        child: SingleChildScrollView(
          child: Column(
              children: summaryData.map((data) {
            return SummaryItem(itemData: data);
          }).toList()),
        ),
      ),
    );
  }
}

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.itemData});

  final Map<String, dynamic> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    print(itemData);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isCorrectAnswer
                ? const Color.fromARGB(255, 52, 255, 218)
                : Color.fromARGB(255, 238, 67, 70),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            ((itemData['question_index'] as int) + 1).toString(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(itemData['question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 8),
              Text(
                '回答: ${itemData['user_answer'] as String}',
                style:
                    const TextStyle(color: Color.fromARGB(255, 202, 171, 252)),
              ),
              const SizedBox(height: 4),
              Text(
                '正解: ${itemData['correct_answer'] as String}',
                style:
                    const TextStyle(color: Color.fromARGB(255, 181, 254, 246)),
              ),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        )
      ],
    );
  }
}
