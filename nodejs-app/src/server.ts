import express from "express";
import Database from "better-sqlite3";
import path from "path";

// --- データベースの準備 ---
// Yesod の config/models（Comment テーブル定義）に相当
const db = new Database("board.sqlite3");
db.exec(`
  CREATE TABLE IF NOT EXISTS comment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    message TEXT NOT NULL
  )
`);

// --- アプリの準備 ---
const app = express();
app.set("view engine", "ejs");                       // EJS を使う（Hamlet に相当）
app.set("views", path.join(__dirname, "../views"));  // テンプレートの場所
app.use(express.urlencoded({ extended: true }));     // フォーム送信を受け取れるようにする

// --- トップページ（GET）：一覧とフォームを表示 ---
// Yesod の getHomeR に相当
app.get("/", (req, res) => {
  const comments = db.prepare("SELECT * FROM comment ORDER BY id ASC").all();
  res.render("index", { comments });
});

// --- 投稿を受け取る（POST）：保存してトップに戻る ---
// Yesod の postHomeR に相当
// app.post("/", (req, res) => {
//   const message = req.body.message;
//   if (message) {
//     db.prepare("INSERT INTO comment (message) VALUES (?)").run(message);
//   }
//   res.redirect("/");
// });

app.post("/", (req, res) => {
  const message = req.body.mesage;   // ← わざと綴りミス（message → mesage）
  db.prepare("INSERT INTO comment (message) VALUES (?)").run(message);
  res.redirect("/");
});

// --- サーバ起動 ---
// Yesod の warp / main に相当
app.listen(3001, () => {
  console.log("Board app running at http://localhost:3001");
});
