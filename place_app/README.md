# place_app

カメラ、位置情報、google_maps_flutter を使ってみたアプリ

## TIL

### Image

Image.file()でデバイス内の path を与えれば画像を取得できる。Image.file(path)か、image: FileImage(path)でローカルパスの画像ファイルを表示できる、ただし Flutter Web ではできないっぽい？

### デフォルト値

constructor のデフォルト値は const が必要

### path, path_provider

path はパスをいじくる用、path_provider は OS 毎の利用可能なファイルパスを取得する

### as

パッケージの名前衝突を防ぐために as

### sqflite

sqflite の型は、INTEGER Dart type: int, REAL Dart type: num, TEXT Dart type: String, BLOB, Dart type: Uint8List
