## テーブル設計

# アプリ名
bookmate

## 概要
このアプリはユーザーの読書の記録を保存できるようにしたアプリになります。また読書を保存したと同時にトップページに記載されるため、他のユーザー含めて、もっと多くの人に読書に関して興味を持ってもらうために作成しました。ご自身の本の投稿であれば、編集や削除が可能となり、他のユーザーに対してはコメントを残す、また特定の人と多く話をしたいという方にはroomを使いお話をしていただくことができます。

## 本番環境


## 制作背景（意図）
近頃の読書離れというのが、顕著に出ていると個人的に思いましたので、本を記録を行うことができるというアプリケーションを作成することによって、少しでも多くの方に読書に対して関心を得ようとしました。

## DEMO

### トップページ
<img width="1440" alt="スクリーンショット 2021-03-25 17 30 45" src="https://user-images.githubusercontent.com/78135308/112446121-355e1800-8d93-11eb-89f5-3daf21a54a00.png">



### 新規登録画面
<img width="1440" alt="スクリーンショット 2021-03-25 17 31 14" src="https://user-images.githubusercontent.com/78135308/112445710-c8e31900-8d92-11eb-80a5-a8c4bbe954db.png">


### 詳細画面



### room画面


## 工夫したポイント
特定の人と話をすることができるというroomを作成することで、しっかりと意見交換ができる場を設け、より多くのoutputを行える環境を整えることができたのかなと思ったからです。


## 使用技術（開発環境）

### フロントエンド
haml css

### バックエンド
Ruby Ruby on Rails

### データベース
MySQL SequelPro

### インフラ

### ソースコード
GitHub GitHubDesktop

### テスト
RSpec

### エディタ
VSCode

## 課題や今後実装したい機能
friendsテーブルを作り、roomを作る際に、フレンドの中から選ぶことができるようにする。
検索機能を作り、ユーザーが目的の本を探しやすくする。
詳細画面で複数枚の画像を貼れるようにする。
自分が累計どのくらいの本を読んだかということをすぐに見れるようする。



## users テーブル

| Colum     |  Type     | Option     |
|---------- |-----------| ---------- | 
| email     |  string   | null: false|
| password  |  string   | null: false|
| nickname  |  string   | null: false|
| profile   |  text     | null: false|


### Association
-has_many :books
-has_many :comments
-has_many :rooms, through: room_users
-ham_many :talks


## books テーブル

| Colum       |   Type     | Option                         |
|-------------|------------|------------------------------- | 
| title       |  string    | null: false                    |
| author      |  text      | null: false                    |
| description |  text      | null: false                    |
| genre_id    |  integer   | null: false                    |
| user        |  references| null: false, foreign_key: true |

### Association

-has_many :comments
-belongs_to :user

## comments テーブル

| Colum     |  Type     | Option                          |
|---------- |--------------| -----------------------------| 
| text      |  text        | null: false                  |
| user      |  references  | ull: false, foreign_key: true|
| book      |  references  | ull: false, foreign_key: true|

### Association

-belongs_to :user
-belongs_to :book

## rooms テーブル

| Colum     |  Type     | Option                          |
|---------- |--------------| -----------------------------| 
| name      |  string      | null: false                  |
| talk      |  text        | null: false                  |
| user      |  references  | ull: false, foreign_key: true|

### Association
-has_many :room_users
-has_many :users, through: room_users
-has_many :talks



## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :room

## talks テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| talking   | text       | null: false,                   |
| user      | references | null: false, foreign_key: true |
| room      | references | null: false, foreign_key: true |

### Association


-belongs_to :user
-belongs_to :room
