# chat_app

A new Flutter project.

## TIL(Firebase)

### FirebaseAuthExceptionで例外処理

``` dart
on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        // ...
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication failed.'),
        ),
      );
```
### FirebaseAuthの認証状態をlisten

``` dart
home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }
```

### FirebaseAuthでサインアップ・ログイン

``` dart
final _firebase = FirebaseAuth.instance;

if (_isLogin) {
        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
      } else {
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
```

### FirebaseStorageにアップロード・画像URL取得

``` dart
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child('${userCredentials.user!.uid}.jpg');

        await storageRef.putFile(_selectedImage!);
        final imageUrl = await storageRef.getDownloadURL();
```

### FireStoreにpost(setは登録・更新可能、addは更新不可)

``` dart
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentials.user!.uid)
            .set({
          'username': _enteredUsername,
          'email': _enteredEmail,
          'image_url': imageUrl,
        });
```

### firestoreのクエリ

``` dart
instanceから取得するときにクエリで並べ替えしておくこともできる

StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots(),
```

### StreamBuilderとFutureBuilder
StreambuilderはFuturebuilderと違い、リアルタイムに値を監視する。FutureBuilderは遷移先が決まってる。

### TextCapitalization
TextCapitalizationで任意の文字を大文字に変換する。

### FocusScope
FocusScope.of(context).unfocus()でキーボードを下げる。

### reverse
ListViewのreverseで下から上に並ぶようにできる

### apiKeyの公開
/android/app/google-services.jsonはignoreする、でないとGCPから不正使用メール飛んでくる。
