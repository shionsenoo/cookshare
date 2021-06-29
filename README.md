# README

アプリケーション名:
cookshare

アプリケーション概要:
自分の作った料理を他の人とシェアし会える

URL(デプロイ済み):
https://cookshare-35695.herokuapp.com/

テスト用アカウント:
アドレス：taro.com
password:111111

利用方法:
・自分の料理レシピを投稿ができ他の人とシェアし会える
・他の人が作った料理のレシピが見れる
・質問などコメントすることができる

目指した課題解決:
・友達と料理についてシェアし会える環境という課題
投稿サイトとすることで友達や料理付きの人からシェアし会える
・質問やアドバイス等を聞きたいという課題
コメント機能で質疑応答などができお互いの情報を共有しあえる

洗い出した要件:
・ユーザー管理機能
目的:devise機能を利用しサインイン機能の実装
詳細:登録をするとユーザーを1人1人管理できる
ストーリー:登録時アドレス等が被ってしまった場合登録できない
          :空白があると登録できない
          :パスワード・アドレスが一致しないとログインできない
・投稿機能
目的:新規投稿をできること
詳細:投稿ボタンを押すと投稿一覧に表示される
ストーリー:必要な投稿内容を入力することが前提
          :1つでも空白があるとエラー表示されるようにした
          :投稿物を分かりやすくするため画像を入力できるようにした
・編集,詳細機能
目的:投稿物の編集、削除をすること
詳細:編集をし更新ボタンを押すと編集内容が反映される
    :削除ボタンを押すと投稿物が削除される
ストーリー:編集内容に1つでも空白があるとエラー表示されるようにした
          :自分以外の編集・削除画面に遷移しようとするとエラーが表示される
          :自分のプロフィール情報も編集できるようにした
・投稿閲覧機能
目的:他の利用者から投稿詳細が見れること
詳細:投稿一覧ボタンを押すと全ユーザーの投稿物が見れる
ストーリー:投稿一覧の詳細内容を見れるようにした
          :投稿者一覧からユーザーの詳細情報を確認できるようにした

実装した機能についての画像やGIF及びその説明:
・サインイン/ログインページ
  [![Image from Gyazo](https://i.gyazo.com/a5c331d831feba7b161649aea64fc2d1.gif)](https://gyazo.com/a5c331d831feba7b161649aea64fc2d1)
・プロフィールの編集機能
  [![Image from Gyazo](https://i.gyazo.com/5fec040dce814a6364ae9195da4b4e62.gif)](https://gyazo.com/5fec040dce814a6364ae9195da4b4e62)
・投稿機能
  [![Image from Gyazo](https://i.gyazo.com/9d9a66bdbdae7358f4b9e548d0d6e831.gif)](https://gyazo.com/9d9a66bdbdae7358f4b9e548d0d6e831)
・投稿編集機能
  [![Image from Gyazo](https://i.gyazo.com/174802a82193ab64193b3e59722b5b75.gif)](https://gyazo.com/174802a82193ab64193b3e59722b5b75)
・投稿物削除機能
  [![Image from Gyazo](https://i.gyazo.com/4cbdfaa0fc7f9b7da7f53dfd64151688.gif)](https://gyazo.com/4cbdfaa0fc7f9b7da7f53dfd64151688)

実装予定の機能:
・コメント機能
・検索機能
・ページネーション機能
・お気に入り機能

データベース設計:
  [![Image from Gyazo](https://i.gyazo.com/16228cdce27f2aa4dcb431e9615dea3d.png)](https://gyazo.com/16228cdce27f2aa4dcb431e9615dea3d)



## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| email            | string | null: false |
| password         | string | null: false |
| nickname         | string | null: false |
| profile          | text   | null: false |
| profile_image_id | string | null: false |

### Association

- has_many   :posts
- has_many   :comments


## posts テーブル

| Column      | Type            | Options     |
| ----------  | --------------- | ----------- |
| title       | string          | null: false |
| body        | text            | null: false |
| image       | text            | null: false |
| user        | references      | null: false |

### Association

- belongs_to   :user
- has_many   :comments

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| contents   | text       | null: false                    |
| user_id    | references | null: false, foreign_key: true |
| post_id    | references | null: false, foreign_key: true |

### Association

- belongs_to   :user
- belongs_to   :post