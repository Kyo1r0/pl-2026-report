{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
import           Yesod
import Text.Lucius (luciusFile)
import Text.Julius (juliusFile)

data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes|
/ HomeR GET
|]

instance Yesod HelloWorld

getHomeR :: Handler Html
getHomeR = do
    css <- withUrlRenderer $(luciusFile "app/template.lucius")
    defaultLayout $ do
        toWidget css
        [whamlet|
            <h1>Hello World!
        |]

main :: IO ()
main = warp 3000 HelloWorld
