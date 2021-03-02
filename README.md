# アプリ名
GYM-MANAGEMENT-34017

# 概要
ジムに登録されている顧客データの管理ができます。
<br>検索機能ですぐに該当の顧客データを習得できることに加えて、前回話した内容等の記録をすることで
<br>リピート客の増加を図ります。
また今回はジムのトレーナーにフォーカスを当てて作成しておりますが、美容院やサロン、整骨院などでも汎用性のあるアプリになっております。
# 本番環境
完成次第URL添付
<br>ログイン情報
- Eメール:
- パスワード:

# 制作背景
私がこのアプリを作成する背景は3点あります。
<br>１点目は私がパーソナルジムに通っていた際にトレーナーの方がトレーニングメニューを手書きしていたことです。手書きしている時間は教えることができず、かつ急いで記入しており見返した際に字が汚く読めないという問題があったことに疑問を抱きました。
<br>２点目は私が美容院に行った際に担当の美容師の方が前回話した内容等を覚えておらず、この状況では顧客が離れてしまうのではないかと推測した為です。
<br>３点目は私の妻がネイルの企業実習に行った際に手書きカルテになっており、翌日のカルテを３０人分準備することに0.45人時かかってしまっていたことです。電子カルテであれば顧客が来店してから検索機能を利用すれば即時に前回の内容が確認できるので、カルテを探すムダを省けるのではないかと考えました。
<br>上記3点の不便を取り除く為に今回検索機能のついた顧客管理アプリを作成することを決意致しました。

# DEMO
## トップページ
画像
## ログインページ
画像
## 新規登録画面
画像
## 顧客一覧画面
画像
## 顧客詳細画面
画像
## 顧客削除編集画面
画像


# 実施予定の内容
- 全体的なビューファイルの変更
- 顧客情報各種機能実装
- 可能であればメッセージ機能

# DB設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| name               | string  | null: false               |
| profile            | text    | null: false               |
| occupation         | integer | null: false               |

### アソシエーション

- has_many :clients
- has_many :records

## clients テーブル

| Column       | Type       | Options           |
| -------------| -----------| ----------------- |
| name         | string     | null: false       |
| gender_id    | integer    | null: false       |
| address      | string     | null: false       |
| phone_number | string     | null: false       |
| e-mail       | string     | null: false       |
| user         | references | foreign_key: true |


### アソシエーション

- belongs_to :user
- has_many   :records

## records テーブル

| Column       | Type       | Options           |
| -------------| ---------- | ------------------|
| times_id     | integer    | null: false       |
| next_day     | date       | null: false       |
| menu         | text       | null: false       |
| story        | text       | null: false       |
| user         | references | foreign_key: true |
| client       | references | foreign_key: true |

### アソシエーション

- belongs_to :user
- belongs_to :client
