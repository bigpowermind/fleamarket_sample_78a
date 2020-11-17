# 概要
テックキャンプの最終課題にて作成したアプリケーションを紹介します。  
また、自身で実装した箇所、および開発を通じて得られた経験についても紹介します。  

## アプリケーション情報

アプリケーション概要  
フリーマーケットのアプリケーションを作成しました。  

接続先情報  
URL http://18.182.74.43/  
ID/Pass  
ID: daifuku  
Pass: daifuku78a  

テスト用アカウント等  
購入者用  
メールアドレス: sample102@sample.com  
パスワード: buyer1234  
購入用カード情報  
番号： 4242424242424242  
期限： 12/24  
セキュリティコード：123  
出品者用  
メールアドレス名:  sample101@sample.com  
パスワード: seller1234  
Githubリポジトリ  
https://github.com/bigpowermind/fleamarket_sample_78a  

# 開発状況  
開発環境  
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code  
開発期間と平均作業時間  
開発期間：8/29~11/7  (71日間)  
1日あたりの平均作業時間：3  
開発体制  
人数：2  
アジャイル型開発（スクラム）  
Trelloによるタスク管理  

# 動作確認方法  
Chromeの最新版を利用してアクセスしてください。  
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。  
接続先およびログイン情報については、上記の通りです。  
同時に複数の方がログインしている場合に、ログインできない可能性がございます。  
テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品  
確認後、ログアウト処理をお願いします。  


# 開発担当箇所  

担当箇所一覧と確認方法  
■デプロイ、本番環境関連  
■トップページ（フロントエンド）  
　　○ http://18.182.74.43/にアクセスするとご覧いただけます。  
■商品一覧表示機能（バックエンド）  
　　○ http://18.182.74.43/にてご覧いただけます。  
■商品出品機能（フロントエンド・バックエンド）  
　　○ 出品用アカウントでログイン後、適当な画像で作業を行うとご覧いただけます。  
■カテゴリー機能（フロントエンド）  
　　○ 商品出品時のカテゴリー選択時に確認することができます。  
■商品編集機能（フロントエンド・バックエンド）  
　　○商品出品後、トップページの商品一覧から出品した商品を選択していただくと商品詳細ページに遷移します。詳細ページ上の編集ボタンを押すことで編集ページに遷移できます。  
■商品削除機能（フロントエンド・バックエンド）  
　　○商品出品後、トップページの商品一覧から出品した商品を選択していただくと商品詳細ページに遷移します。詳細ページ上の削除ボタンを押すことで商品を削除することができます。  
■商品購入機能（フロントエンド・バックエンド）  
　　○購入者用アカウントでログイン後、適当な商品を選択することで商品購入画面へ進めます。  

# 各担当箇所の詳細  
■デプロイ、本番環境関連  
○ 概要  
・アプリケーションをEC2のサーバにデプロイし全世界に公開しています。  
・使用技術はAWS、Ruby on Rails（6.0系）です。  
○担当内容  
・基本となるroutes、controller、modelの設置  
・carrierwaveというgemを使って画像のアップロードを実装  
・Capistranoを利用した自動デプロイ  
・S3の導入  
・basic認証の実装  
・本番環境でのテスト、エラー解決  

■トップページ（商品新着一覧ページ）  
○概要  
・新着順に商品が一覧表示されるページ  
○担当内容  
・haml,scssを使用してのトップページのマークアップ作業  


■商品一覧表示機能  
○概要  
・出品された商品が新着順に5件表示されます。  
○担当内容  
・ルーティング、コントローラー、モデルの作成・実装  

■商品出品機能   
○概要  
・出品する商品の情報を登録できます。  
○担当内容  
・activehashというgemを使ってのプルダウン表示選択機能実装  
・モデルの設定（アソシエーション、バリデーション）  
・JavaScriptを使用した画像の差し替え  
・単体テスト  

■カテゴリー機能  
○概要  
・出品する商品のカテゴリーを選択できます。  
○担当内容  
・ancestryというgemを使ってのプルダウン表示選択機能実装  

■商品編集機能  
○概要  
・登録した商品の情報を変更できます。  
・商品出品時とほぼ同じUIで実装しています。  
・画像やカテゴリーの情報など、すでに登録されている商品情報は編集画面を開いた時点で、もれなく表示されるようにしています。  
○担当内容  
・haml,scssを使用してのマークアップ  
・編集、変更を行うためのルーティング・コントローラーの設定  
・単体テスト  

■商品削除機能  
○概要  
・登録した商品を削除できます。  
○担当内容  
・削除を行うためのルーティング・コントローラーの設定  

■商品購入機能  
○概要  
・出品されている商品を購入することができます。  
○担当内容  
・haml,scssを使用してのマークアップ  
・payjpを使用してのクレジットカードの登録・削除  
・購入を行うためのルーティング・コントローラーの設定  
・単体テスト  


# 開発を通じて得られた知見  

工夫した点  
①チームとして工夫を行った点  
・基本的にマークアップを行ったメンバーがサーバーサイド側の実装も行うことで、スムーズに作業を進めることができました。  


・コンフリクトが生じた際には必ずメンバー同士で確認をとるようにしていました。これにより、エラーや不具合を少なくすることができました。  


・メンバー同士で現在の作業内容を細かく情報共有するようにしていました。これにより、お互いの進捗状況を把握することができ、効率良く実装をすることができました。  


②個人として工夫を行った点  
・デプロイ担当としてデプロイする前には必ずローカル環境でエラーや不具合がないか細かく確認を行いました。これにより、本番環境でのエラーや不具合を最小限にすることができたと思います。  


・メンバーの進捗を気にかけるようにしてました。進捗が滞っている場合には可能な範囲でサポートしました。  


・ユーザー目線に立ち、見やすく使いやすいアプリケーションの作成を心がけました。  


苦労した点  
①チームとして苦労した点  
・通常、3~5人で行うチーム開発において2人で開発を行いました。作業量が多いこと、進捗が滞ることがあり納期までに間に合うのか、不安や焦りを感じることがありました。  
そこで、細かく情報共有を行うことでお互いの状況を把握するようにしました。そして、納期から逆算して予定していたタスクをメンバー間で変更や調整することでなんとか納期までに完成することができました。  
限られた時間の中で、早め早めに実装するように心がけていたものの、難しい実装になると進捗が滞ってしまいました。その結果、納期直前での完成となりました。  
今後は、さらに余裕をもった実装を行えるようにタスクの見積もりを細かくしていく必要があると感じました。

②個人として苦労した点  
・デプロイ・本番環境でのエラー解決  
開発前、AWSを用いてのデプロイは1度しか経験がありませんでした。  
そのため、作業中に行き詰まることが多々ありました。しかし、その都度解決方法を調べ、学ぶことでデプロイへの理解を深めることができました。
また、本番環境でエラーが起きた際もログを確認してエラー解決を図ることができるようになり、苦手だったLinuxコマンドをもっと学びたいと思うようになりました。

・Github  
コンフリクトが起きた際には、必ずメンバーに確認を行い一つずつ解消するようにしてきました。  しかし、メンバーが消してはいけないコードを削除していたことがあり解決に時間を要することがありました。  
その中でも苛立たず、落ち着いて解決できるように思考を整理して作業をするようにしました。


・メンバー間での作業時間・作業スピードのズレ  
社会人で仕事をしているということもあり、学習への向き合い方に差異が生じていると感じることがありました。その中でメンバーの作業が中々進まずに納期までに間に合うのか不安や焦りを感じることが多くありました。  
そのため、自分のほうから細かく連絡をとるようにしていました。また、メンバーが実装で詰まっている部分を一緒に解決したり、メンバーが実装を予定していたタスクを引き受けることで納期までに完成することができました。  
その結果、自分の理解をさらに深めることができ、多くの機能を実装することでスキルをより高めることできたと感じています。  
以上


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|strimg|null: false, unique: true|
|icon|string|
|introduction|text|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|

### Association
- has_many :items dependent: :destroy
- has_many :contact_informations dependent: :destroy
- has_many :creditcards dependent: :destroy
- has_many :Comments 


## creditcardテーブル

|Column|Type|Options|
|------|----|-------|
|card_id|string|null: false|
|customer_id|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## contact_informationテーブル

Column|Type|Options|
|------|----|-------|
|destination_family_name|string|null: false|
|destination_first_name|string|null: false|
|destination_family_name_kana|string|null: false|
|destination_first_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number|string|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to: user


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explain|text|null: false|
|status|string|null: false|
|delivery_fee|string|null: false|
|region|string|null: false|
|days|string|null: false|
|price|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user dependent: :destroy
- has_many :images dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- has_many :comments dependent: :destroy


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item


## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
- has_many :items


## brandテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|item_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
