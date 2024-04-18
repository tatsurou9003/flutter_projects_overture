# shopping_app

A new Flutter project.

## TIL

### Map は Iterable じゃない

<Map>.entries で iterable オブジェクトを得る。

### Form ウィジェット

Form に GlobalKey を追加して、子の TextformField を識別する。

### context.mounted

Don't use 'BuildContext's across async gaps. → async 内でコンテキストを利用しようとした場合、コンテキストが変わってないと言い切れないので context.mounted で context がまだあるのか確認する必要がある。

### pop 後に関数実行

Navigator.push は await することで、pop して戻ってきたときに関数を実行するようにできる。

### try catch

負荷の大きい処理は try catch で囲む事を検討する。

### FutureBuilder

future: Future データを返すメソッドを指定
builder : ビルドしたいウィジェットを return で返す。 この時に snapshot インスタンスを用いて条件分岐を作ることができる（これが FutureBuilder を用いる大きなメリット）

FutureBuilder は、あらかじめ initState で Future オブジェクトを作っておいて future に渡すのが吉。
