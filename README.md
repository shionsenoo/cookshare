# README

アプリケーション名:
cookshare

アプリケーション概要:
自分の作った料理を他の人とシェアし会える

URL(デプロイ済み):

テスト用アカウント:

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

実装した機能についての画像やGIF及びその説明:

実装予定の機能:

データベース設計:

ローカル環境での動作方法:
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