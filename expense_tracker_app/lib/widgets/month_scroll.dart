import 'package:flutter/material.dart';

class MonthScroll extends StatelessWidget {
  const MonthScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(12, (index) {
          int number = index + 1; // Start numbering from 1
          return Container(
            margin:
                const EdgeInsets.all(8), // Add some space between the buttons
            height: 40,
            width: 40,
            child: Center(
              child: FloatingActionButton(
                mini: true,
                onPressed: () {
                  // 月ごとのデータを表示する処理を追加
                },
                child: Text('$number月'),
              ),
            ),
          );
        }),
      ),
    );
  }
}
