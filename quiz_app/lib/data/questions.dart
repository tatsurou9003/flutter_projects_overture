import "package:quiz_app/models/quiz_question.dart";

const questions = [
  QuizQuestion(
    'Flutterにおいて最も主要な構成要素はどれ？',
    [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuizQuestion('どうやってFlutterのUIは構成される？', [
    'コード内でWidgetツリーが構成される',
    'エディター内でWidgetツリーが構成される',
    'ConfigファイルでWidgetツリーが定義される',
    'XCode for iOS もしくは Android Studioが頑張る',
  ]),
  QuizQuestion(
    'StatefulWidgetを利用する利点は？',
    [
      'データに変更が生じたときにUIを再構成するため',
      'データに変更が生じたときにデータを再構成するため',
      'データの変更を無視するため',
      'データによらずUIを構成するため',
    ],
  ),
  QuizQuestion(
    'StatelessWidget or StatefulWidget 使えるならどっちを使うべき？',
    [
      'StatelessWidget',
      'StatefulWidget',
      'どっちでもいい',
      'どっちでもない',
    ],
  ),
  QuizQuestion(
    'StatelessWidgetでデータに変更が発生したらどうなる？',
    [
      'UIは変わらない',
      'UIは更新される',
      '最も近いStatefulWidgetが更新される',
      'ネストされてるStatefulWidgetが更新される',
    ],
  ),
  QuizQuestion(
    'StatefulWidget内のデータ更新を反映するには？',
    [
      'setState()',
      'updateData()',
      'updateUI()',
      'updateState()',
    ],
  ),
];
