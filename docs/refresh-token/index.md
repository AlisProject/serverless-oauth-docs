
# アクセストークンの再取得

取得した各種トークンには以下の通り有効期限が設定されています。

* access_token: 3600 秒
* refresh_token: 無期限
* id_token: 3600秒

access_token の有効期限が切れた場合は refresh_token を用いて再取得してください。

リクエストは以下のパラメーターを指定してください。

* grant_type: refresh_token
* refresh_token: (取得したrefresh_token)
* client_id: ネイティブアプリのみ client_id を指定してください

## サーバサイドアプリケーション向け

リクエスト例

```
POST /oauth2/token HTTP/1.1
Authorization: Basic xxxxxxxxxxxxxxxxx
content-type: application/x-www-form-urlencoded
Host: alis.to

grant_type=refresh_token&refresh_token=xxxxxxxxxx
```

## ネイティブアプリケーション向け

リクエスト例

```
POST /oauth2/token HTTP/1.1
content-type: application/x-www-form-urlencoded
Host: alis.to

grant_type=refresh_token&client_id=1234567890&refresh_token=xxxxxxxxxx
```
