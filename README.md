# 【課題C】 Webアプリ：Node.js vs. Yesod

## [Node.js](https://nodejs.org/ja)

Node.jsはJavascriptの実行する実行環境である。
特徴はJavascriptでも、サーバーサイドのプログラミングができる点である。
これにより、フロントエンドとサーバーサイドを同じ言語で記述できる。

また、Node.jsは頻繁に更新されている。2026年8月時点では、最新版はv26系であり、
長期サポート版であるLTS版は24系である。本レポートでは、LTS版を用いて開発を行った。

Node.jsでは、TypeScriptによって開発を行うこともできる。
TypeScriptはJavascriptに型システムが追加されたPLである。
プログラミングにおいて、Javascriptと異なる点はデータ型を宣言することである。
これによって、データ型が一致しない場合や誤った使い方をした場合、TypeScriptはエラーによって間違いを実行前に知らせることができる。
しかし、必ずしもデータ型を明記する必要はない。データ型を記述しない場合は、文脈や値によって、TypeScriptはデータ型を指定する。
本レポートでは、TypeScriptを用いた。

また、expressというフレームワークを開発で用いた。
expressはNode.jsで実行可能なWebフレームワークである。
このフレームワークでは、各HTTPメソッドが関数として用意されているため、それに従ってプログラミングすることでwebアプリ開発を行うことができる。さらに、この関数の機能は、Typescritpの文脈依存の型推論を行うため、データ型をコンパイラが指定する。

### 具体例

以下は、本レポートで作成した掲示板アプリのコードの一部である。

トップページを表示する処理は次のようになっている。

```typescript
app.get("/", (req, res) => {
  const comments = db.prepare("SELECT * FROM comment ORDER BY id ASC").all();
  res.render("index", { comments });
});
```

`app.get` は Express が提供する関数であり、第一引数の URL（`"/"`）に GET リクエストが来たときに、第二引数の関数を実行する。この関数の引数 `req`（リクエスト）と `res`（レスポンス）には型注釈を記述していない。しかし、`app.get` に渡す関数という文脈から、TypeScript が `req` を `Request` 型、`res` を `Response` 型であると、文脈依存の型推論によって自動的に推論している。

投稿を受け取る処理は次のようになっている。

```typescript
app.post("/", (req, res) => {
  const message = req.body.message;
  if (message) {
    db.prepare("INSERT INTO comment (message) VALUES (?)").run(message);
  }
  res.redirect("/");
});
```

`"/"` に POST リクエストが来たとき、フォームで送信された内容を `req.body.message` として受け取り、データベースに保存している。ただし `req.body.message` の型は推論されず `any` 型となるため、値が存在するかどうかは `if (message)` によって自分で確認する必要がある。このように、Express と TypeScript の組み合わせでは、外部から送られてくる入力の妥当性は開発者が手動で検証しなければならない。


## [Yesod](https://www.yesodweb.com/)

* 最新の[Yesod](https://www.yesodweb.com/)を概説
* 具体例を示す

## Webアプリ例

* 実装したWebアプリを概説
* 後述の比較を念頭に説明すること

## Node.js/TypeScript vs. Yesod/Haskell

* 前述のWebアプリの例を念頭に，Node.jsとYesod，TypeScriptとHaskellを比較する
* 違いに対する評価も必要

## 参考文献

- Node.js 公式：https://nodejs.org/ja
- Node.jsのイントロダクション:https://nodejs.org/learn/getting-started/introduction-to-nodejs
- Node.jsでのTypeScript:https://nodejs.org/learn/TypeScript/introduction
- TypeScriptにおける方推論:https://www.TypeScriptlang.org/docs/handbook/type-inference.html
- expressの説明:https://expressjs.com/ja/
- expressの具体例:https://expressjs.com/ja/5x/starter/hello-world/
- Yesod 公式：https://www.yesodweb.com/


