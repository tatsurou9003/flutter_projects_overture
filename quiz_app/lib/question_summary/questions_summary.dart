import 'package:flutter/material.dart';

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
    return Row(
      children: [
        Text(
          ((itemData['question_index'] as int) + 1).toString(),
          style: const TextStyle(color: Colors.white),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                itemData['question'] as String,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                itemData['user_answer'] as String,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                itemData['correct_answer'] as String,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}
