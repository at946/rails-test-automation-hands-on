# README
このRails on Dockerアプリケーションは[【Rails】こわくないからこっちにおいで！TDD/BDDでテスト自動化ことはじめ。](https://qiita.com/at-946/items/45438562042e3b2643e7)で使ってもらうためのものです。

alpine linuxベースのRailsコンテナ、PostgreSQLコンテナで構成されています。

あらかじめ、Selenium-Webdriver、RSpec、Capybaraなどの初期設定がされているので、テストコードを書けばRSpecのSystem testが実行できる状態になっています。
アプリは空の状態なので、Hello Railsページが出るだけです。

# Usage（ハンズオン前の確認事項）
まずはこのレポジトリをローカルにクローンしてください。

```
$ git clone git@github.com:at946/rails-test-automation-hands-on.git
```

まずDocker imageをビルドし環境の初期構築をします。

```
$ cd rails-test-automation-hands-on
$ docker-compose build
$ docker-compose run web yarn install --check-files
$ docker-compose run web rails db:create
$ mkdir spec/system
```

一度コンテナが正常に起動するかを確認しておきます。

```
$ docker-compose up -d
```
少し時間がかかりますが、`http://localhost:3000`にブラウザからアクセスして"Yay! You’re on Rails!"というメッセージのHello Railsページが表示されます。
確認したらコンテナを落としておきます。

```
$ docker-compose down
```
