# meal_app

A new Flutter project.

## TIL

### StatefullWidget について

更新の必要がある Widget だけ更新するが、チェックは全ての widget に対して行われるため、負荷になる場合がある。StatefullWidget はできるだけ細かくすることでパフォーマンスの向上につながる。だから Flutter hooks がでてくる？

### Widget, Element, State

element は widget の位置と state をバラバラに参照する。widget に key の情報を付加することで同時に widget と state の参照を行えるようにする。（ValueKey or ObjectKey を使うと、オブジェクト及び、その state を同時に扱えるということ。補足すると element は widget の数とタイプしか見てない、何てやつだ。）

### final と const

final はメモリアドレス（値への参照）を再生成するのを禁止、const はアドレスの再生成もオブジェクトの変更も禁止。

### InkWell VS GestureDetector

InkWell は視覚的なフィードバック、タップ検出を提供

GestureDetector は、タップ以外のジェスチャー（ドラッグ、スワイプ、ピンチな）を検出を提供

### BoxFit.

はみ出ても widget の限界まで表示してくれるのが boxfit.cover, 縦横比を変えて表示してくれるのが.fill

### 単にスクロールしたいとき

単にスクロール可能にする場合、ListView(), SingleChildScrollView でラップするだけでいい。

### スタック

pushReplacement でスタックを置き換える（上に遷移先を載せない）

### Navigator

Navigator.pop でデータを返し、.push したところで受け取る。
