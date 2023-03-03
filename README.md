# English Diary ✍🏼

## English Diaryとは？<br>
英会話能力を向上させたいと思っている英語学習者向けのアプリです！<br><br>

英会話能力を高めるため「英語で日記を書く」ことが流行っているかと思います。<br><br>

私自身もInstagramを利用して英語日記を投稿していたのですが、<br>
「こんな機能があったらいいのにな」と思ったことがあったので、英語日記アプリを作成しました。<br><br>


## デモ
#### 英語日記、調べた単語・フレーズ投稿機能
![デモ１](https://user-images.githubusercontent.com/81918738/221407604-ad7991b9-0674-4cf8-ada4-f31b09d1dcd7.gif)<br><br>

* 日本語で日記を書いた後、英語で日記を書き投稿します
* 「これって英語でなんて言うんだろう？」と思った単語・フレーズを調べて記録し、自身の単語帳に保存出来ます
* 単語は１つの日記につき、何個でも保存出来ます<br><br>


#### 単語テスト機能
![デモ2](https://user-images.githubusercontent.com/81918738/221408010-6c421aa3-8a22-4469-97af-c2f7e8300a89.gif)<br><br>

* 自身で保存した単語リスト（単語帳）から、単語テストを行い、学んだことの復習が出来ます<br><br><br>


## 使用技術

* __開発環境__
  * __Docker 20.10.16 / docker-compose 3.9__

* __フロントエンド__
  * __HTML / tailwindcss / javascript__

* __バックエンド__
  * __Ruby 3.1.0__
  * __Rails 7.0.4.1__

* __インフラ__
  * __CircleCI__
  * __PostgreSQL 13.9__
  * __AWS(S3, IAM)__ <br><br><br>


## 機能
* __ユーザー登録関連機能__
  * 新規登録機能
  * プロフィール編集機能
  * ログイン、ログアウト機能
  * ゲストユーザーログイン機能

* __マイページ関連機能__
  * 日記投稿日数表示機能
  * 日記投稿回数表示機能
  * 学んだ単語数表示機能

* __英語日記投稿機能__
  * 日本語日記、英語日記投稿機能
  * 日記編集、削除機能
  * 日記を全ユーザーに公開・非公開するか選択出来る機能
  * 全ユーザーの日記表示機能

* __単語・フレーズ登録機能__
  * 日記投稿と同時に、調べた単語・フレーズを単語帳に登録出来る機能（オリジナルな単語帳作成機能）
  * 単語・フレーズをテストで復習出来る機能
  * 単語帳の単語から過去の自分の日記に戻る機能<br><br><br>



## 最後に

私自身、TOEICでは900点以上点数を取ることが出来るものの、<br>
いざ英会話！となると、全く言葉が出てこず、もどかしい思いを何度もしてきました。<br>
英語日記に継続して取り組むことで、「これ、英語で何て言うんだろう？」と思うことを減らすことが出来ました。<br><br>

英語日記がスピーキング能力向上の近道であると信じています。<br>
English Diaryを利用し、みんなで英会話能力を向上させましょう！<br><br><br>

## インストール方法
```
$ git clone https://git.heroku.com/polar-citadel-36477.git
$ cd english_diary_app
$ docker-compose build
$ docker-compose up -d
$ docker-compose run web rails db:create
$ docker-compose run web rails db:migrate
$ docker-compose run web rails db:seed
