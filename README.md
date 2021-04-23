# CareFarm
このアプリには<span>２つ</span>の用途があります。

①福祉施設で使用する業務システムです。  
②入所者様が外出、外泊した際に簡単に記録を残せるものです。

想定しているユーザーは２種類です。
①福祉施設に従事している職員  
②入所者の様子を記録したいご家族

# なぜ作ったのか
私は以前に社会福祉士や介護福祉士として勤務していました。
その際に外泊や外出された入所様の薬の飲み忘れや、食事や排泄の有無、状態の変化などはご家族様の記憶をもとに業務記録を入力していました。
こういった記憶に頼った情報は事実と異なる場合も考えられるため、思わぬ事故に通じる可能性があると感じました。
その時の経験を元に、このような問題を解決するためCareFarmを作りました。

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
・ユーザー登録、ログイン機能
・投稿機能
  申し送りを投稿、一覧を確認
  メモ機能(vue.js使用)
・ページネーション機能
・検索機能(一部ransck)
・メッセージ機能(一部ajax)
・api
    バックエンドにrails、フロントにvue.jsを使用(メモ機能)
    Youtubeのapiを使用


# AWS構成
![aws_flow](https://user-images.githubusercontent.com/66477859/115424404-a4ffdf80-a239-11eb-9b8b-2463e84dc35c.jpg)


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


# テスト
・Rspec
  単体テスト(model)
  機能テスト(request)
  統合テスト(system)


# アウトプットツール
Qiita
https://qiita.com/godasper/private/d7be578907cec6c5e594
