{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Home where

import Import

-- メッセージ投稿フォームのデータ（本文だけ）
newtype CommentForm = CommentForm
    { commentFormMessage :: Text
    }

-- 共通：一覧とフォームを表示する処理
showBoard :: Handler Html
showBoard = do
    allComments <- runDB getAllComments
    (formWidget, formEnctype) <- generateFormPost commentForm
    defaultLayout $ do
        setTitle "一言掲示板タイトル"
        $(widgetFile "homepage")

-- トップページ（GET）：一覧とフォームを表示
getHomeR :: Handler Html
getHomeR = showBoard

-- 投稿を受け取る（POST）：保存してトップに戻る
postHomeR :: Handler Html
postHomeR = do
    ((result, _), _) <- runFormPost commentForm
    case result of
        FormSuccess cf -> do
            _ <- runDB $ insert $ Comment (commentFormMessage cf) Nothing
            redirect HomeR
        _ -> showBoard

-- フォームの定義（テキスト1つ）
commentForm :: Form CommentForm
commentForm = renderDivs $ CommentForm
    <$> areq textField "メッセージ" Nothing

-- 全コメントを古い順に取得
getAllComments :: DB [Entity Comment]
getAllComments = selectList [] [Asc CommentId]