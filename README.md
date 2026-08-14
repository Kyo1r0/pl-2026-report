# 【課題C】 Webアプリ：Node.js vs. Yesod

## [Node.js](https://nodejs.org/ja)

Node.jsはjavascriptの実行する実行環境である。
特徴はjavascriptでも、サーバーサイドのプログラミングができる点である。
これにより、フロントエンドとサーバーサイドを同じ言語で記述できる。

また、Node.jsは頻繁に更新されている。2026年8月時点では、最新版はv26系であり、
長期サポート版であるLTS版は24系である。本レポートでは、LTS版を用いて開発を行った。

Node.jsでは、Typescriptによって開発を行うこともできる。
Typescriptはjavascriptに型システムが追加されたPLである。
プログラミングにおいて、javascriptと異なる点はデータ型を宣言することである。
これによって、データ型が異なっている場合や間違った使い方をした場合、Typescriptはエラーによって間違いを実行前に知らせることができる。
しかし、必ずしもデータ型を明記する必要はない。データ型を記述しない場合は、文脈や値によって、Typescriptはデータ型を指定する。
本レポートでは、Typescriptを用いた。

また、expressというフレームワークを開発で用いた。
expressはNode.jsで実行可能なwebフレームワークである。




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
- Node.jsでのTypescript:https://nodejs.org/learn/typescript/introduction
- Typescriptにおける方推論:https://www.typescriptlang.org/docs/handbook/type-inference.html
- expressの説明:https://expressjs.com/ja/
- expressの具体例:https://expressjs.com/ja/5x/starter/hello-world/
- Yesod 公式：https://www.yesodweb.com/


