# expense_tracker_app

月毎かつ、category ごとの支出を出力しようとしたが時間かかりそうなため一旦寝かせる。

## TIL

### ListView.builderのパフォーマンス
ListView.builderは最初に表示される部分だけ描画する（Columnは裏で全てのデータを描画する）。ちなみにbuilderで渡されるctxと、BuildContextのcontextは異なる（ctxはListViewを含むwidgetツリーを構成した段階のElementツリーが渡されている）。そのため描画時のパフォーマンスが担保されるというわけ。

### 3種のツリー
Widget, Element, Renderのツリーがある。WidgetツリーはElementツリーを作る指示・設定みたいなもの。ちなみによく出てくるcontext（BuildContextとか）で渡される情報はelementツリーそのものと言って良い。Renderは描画担当。

### ThemeData
Theme.of(context)でmainで設定したThemeDataにアクセスできる。

### WidgetFlutterBinding.ensureInitialized()
runAppを呼び出す前に、Flutter engineの機能（画面の向きやDB）を利用したい場合はensureInitizlized()。

### Constraints go down, Size go down.
Widgetは親WidgetにSizeを決めてもらって子WidgetのSizeを指定する必要がある。  
Columnはheightを無限に大きくしようとし、widthは子に依存する。そのためSizeを指定してあげないとエラーになるよねという話。（Scaffoldに直接ぶち込んでも大丈夫な理由はScaffoldの最大サイズがデバイスサイズで決定されているから）  
Widget毎にSizeの選好性があるから気を付ける、Row・ColumnはExpandedでラップしとけば大抵なんとかなる。

### SafeArea
デバイスの隠しちゃいけないとこを検知して空けてくれる。ちなみにScaffoldにはSafeAreaが元々適応されている。

### mediaQuery vs LayoutBuilder
両方とも画面サイズを教えてくれるが、LayoutBuilderの方が明示的で分かりやすい気する知らんけど。

### Platformの判別
Android, IOSを判別するためにdart IOのPlatformを使う。
