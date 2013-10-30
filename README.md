Kampa Proxy API
======================

Kampa! APIから登録している個々のアイテム情報を1度に取得するためのProxy APIです。

### API 仕様

GETリクエストでKampa!に登録しカンパ募集をしているアイテム情報を取得することができます。

	http://kampa-proxy-api.herokuapp.com/kampa/Bpk1vpkPxpg5Xp1z59Si0MlX

のように http://kampa-proxy-api.herokuapp.com/kampa/ のAPIエンドポイントに
Kampa!のConsumer keyを送ることで、簡単にカンパ募集中のアイテムの一覧が取得できます。

このAPIが返すデータはJSON形式になっています。
また、callback関数を指定した場合、JSONP形式で返されます。

	{
		"status_code": "200",
    	"data": [
	    	{
				"user_account_name": "ほげほげ",
				"user_account_url": "https://www.facebook.com/hoge.hoge",
				"pic": "http://ecx.images-amazon.com/images/I/41OS54a4b-L.jpg",
				"title": "レッドブルエナジードリンク 250ml×24本",
				"description": "つばさをください",
				"kmp_list": [
					{
						"amt": "1000",
						"date": "2013-10-28 17:45:28"
					},
					{
						"amt": "500",
						"date": "2013-10-30 13:02:22"
					}
				],
				"URL": "http://www.amazon.co.jp/RedBull-%E3%83%AC%E3%83%83%E3%83%89%E3%83%96%E3%83%AB-%E3%83%AC%E3%83%83%E3%83%89%E3%83%96%E3%83%AB%E3%82%A8%E3%83%8A%E3%82%B8%E3%83%BC%E3%83%89%E3%83%AA%E3%83%B3%E3%82%AF-250ml%C3%9724%E6%9C%AC/dp/B005F25MQ0%3FSubscriptionId%3DAKIAJ47V7S76L7MT2KAQ%26tag%3Ddegg-22%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB005F25MQ0",
				"kmp_num": "2",
				"percentage": 31,
				"kmp_page": "http://kampa.me/t/dbi",
				"item_bs": "dbi",
				"public": "1"
			},
			{
				"user_account_name": "ほげほげ",
				"user_account_url": "https://www.facebook.com/hoge.hoge",
				"pic": "http://ecx.images-amazon.com/images/I/5173DQBjzDL.jpg",
				"title": "アディダス フリーフットボール ショートフィンガーグローブ ブラック×ビビッドイエロー 8",
				"description": "",
				"kmp_list": null,
				"URL": "http://www.amazon.co.jp/%E3%82%A2%E3%83%87%E3%82%A3%E3%83%80%E3%82%B9-%E3%83%95%E3%83%AA%E3%83%BC%E3%83%95%E3%83%83%E3%83%88%E3%83%9C%E3%83%BC%E3%83%AB-%E3%82%B7%E3%83%A7%E3%83%BC%E3%83%88%E3%83%95%E3%82%A3%E3%83%B3%E3%82%AC%E3%83%BC%E3%82%B0%E3%83%AD%E3%83%BC%E3%83%96-%E3%83%96%E3%83%A9%E3%83%83%E3%82%AF%C3%97%E3%83%93%E3%83%93%E3%83%83%E3%83%89%E3%82%A4%E3%82%A8%E3%83%AD%E3%83%BC-8/dp/B00BEPIQ56%3FSubscriptionId%3DAKIAJ47V7S76L7MT2KAQ%26tag%3Ddegg-22%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00BEPIQ56",
				"kmp_num": "0",
				"percentage": 0,
				"kmp_page": "http://kampa.me/t/dbr",
				"item_bs": "dbr",
				"public": "1"
			}
		],
		"status_text": "OK"
	}

返ってくるオブジェクトには以下のプロパティが含まれています。

__status_code__
HTTPのステータス・コード

__data__
APIの結果に関するオブジェクト

__user_account_name__
Kampa! に紐付けられているアカウント名

__user_account_url__
Kampa! に紐付けられているアカウントのURL

__pic__
募集中のアイテムのAmazonの画像

__title__
募集中のアイテム名

__description__
説明文
__kmp_list__

__URL__
アイテムのAmazonでのURL

__kmp_num__
カンパ数

__percentage__
達成度

__kmp_page__
Kampa!でのページURL

__item_bs__
Kampa!の管理ID

__public__
Kampa!での公開・非公開フラグ

__status_text__
レスポンスに関するテキスト

### 更新履歴

- 2013/10/23 First Release.



