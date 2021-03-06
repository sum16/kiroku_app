# CareFarm
このアプリには<span>**２つ</span>の用途**があります。

  ①福祉施設で使用する**業務システム**です。  
  ②入所者様が外出、外泊した際に*簡単に記録を残せるもの*です。

想定しているユーザーは**２種類**です。  

  ①福祉施設に従事している職員  
  ②入所者の様子を記録したいご家族

# なぜ作ったのか
私は以前に社会福祉士や介護福祉士として勤務しており、その時に感じた問題を解決するものをアプリとして作ろうと思いました。  

問題点:  
  外泊や外出された入所様の薬の飲み忘れがあったり、食事や排泄の有無、状態の変化などは*ご家族様の記憶*をもとに業務記録を入力していたこと。  

本来であれば外泊や外出は職員の管轄外であるため家族側の責任です。  
しかし記憶に頼った情報は事実と異なる場合も考えられるため、  
・施設の方でも**思わぬ事故に通じる可能性がある**こと  
・ご家族との**信頼関係を損なう可能性**がある事  

このような事が起きる可能性があります。  
このような問題を解決するべくCareFarmを作った次第です。  

# ER図 
https://qiita.com/godasper/private/506eeeeecec42140b065

# URL 
職員側　
http://my-portfolio3298.work/caregiver

家族側
http://my-portfolio3298.work/family

# このアプリの可能性
2019年 国民生活基礎調査によると老老介護(介護者と被介護者が双方とも65歳以上の高齢者となっている状態を指す)の割合は<span>6割とのデータがあります</span>  
ご高齢になるにつれ、認知機能や記憶力は低下していきます。日々の記録を取っておくことによってご家族に何かあった際に医療従事者の方々は的確な判断が下せます。
今後高齢化は進む一方です。こういった方々にもCareFarmは利用していただけると考えています。


# アプリの機能一覧
職員:  
・ユーザー登録、ログイン機能(更新、削除)  
・ゲストユーザーログイン機能  
・投稿機能(一覧表示、詳細表示、新規登録)  
・投稿検索機能(Ajax)、確認ボタン機能(Ajax) 
・モニタリング作成機能(SPA)
    バックエンドにrails、フロントにVue.jsを使用 
・顧客情報管理(一覧表示、詳細表示、新規登録、更新、削除)  
・顧客情報の検索  
・ログイン、ログアウト記録の閲覧  
・イベント管理機能  
・ユーザーからのメッセージ管理機能  
・ページネーション機能  
・csv出力機能  


家族:  
・ユーザー登録、ログイン機能(更新、削除)  
・ゲストユーザーログイン機能  
・記録一括作成機能(一覧表示、詳細表示、新規登録)  
・記録検索機能  
・イベント申し込み、キャンセル機能  
・問い合わせ機能(返信の管理含む)  
・メッセージ機能  
・youtube閲覧機能(Youtubeのapiを使用)  
・メモ機能
  バックエンドにrails、フロントにVue.jsを使用  
・ページネーション機能  


# AWS構成
![aws_flow](https://user-images.githubusercontent.com/66477859/115424404-a4ffdf80-a239-11eb-9b8b-2463e84dc35c.jpg)

# 制作時間
400h

# 使用技術
* Rails 6.0.3.5 
* Ruby 2.6.6
* PostgreSQL 13.1
* バージョン管理 git version 2.30.0
* 開発環境 Docker version 19.03.13 / docker-compose version 1.27.4
* インフラ　AWS(EC2,RDS,Route53)
* Nginx 1.18.0
* Puma 4.3.7
* Capistrano3
* Rspec 4.0.2
* YouTube Data API 
* circle ci(テスト)


# テスト
・Rspec
  単体テスト(model)
  機能テスト(request)
  統合テスト(system)


# アウトプットツール
Qiita
https://qiita.com/godasper/private/d7be578907cec6c5e594
