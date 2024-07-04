# シフト管理および給与計算アプリ

このアプリケーションは、Sinatraを使用してシフトの入力および給与計算を行うシンプルなWebアプリケーションです。シフトデータと給与情報を保存するためにYAMLファイルをデータベースとして使用します。
3週間で、テーマの立案から開発までを3人で行いました。
役割として、バックエンドを担当しました。


## 目的、ターゲット
アルバイトやパートをしている方のために、シフト管理や給与計算を簡単に行うためのものを作りたいと思い開発しました。


## 機能

- **シフト入力**: ユーザーは出勤時間、退勤時間、休憩時間を含むシフトの詳細を入力できます。
- **シフトログ表示**: すべての入力されたシフトの一覧を表示します。
- **給与計算**: 提供された時給に基づいて、合計労働時間および対応する給与を計算します。
- **ユーザーデータ管理**: シフトデータと給与情報を保存します。


## 使用方法

## トップページ

- アプリケーションのトップページです。ここからシフト入力ページや個人情報ページに移動できます。

### シフト入力ページ

- **URL**: `/index`
- シフトの出勤時間、退勤時間、休憩時間を入力し、結果ページにシフトデータを送信します。

### シフト結果ページ

- **URL**: `/result`
- 入力されたシフトの一覧が表示されます。

### 個人情報ページ

- **URL**: `/mypage`
- 時給を入力して保存します。

## 使用環境

- Ruby
- Sinatra: シンプルなRubyフレームワーク、サーバーサイドの学習のために、自分で１から描けるsinatraを使用しました。
- YAML: データの保存と読み込みに使用
- 


### Installation
- リポジトリ https://github.com/momo0128/shift_app.io
- 
- 
- 










