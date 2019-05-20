# OAuth2.0 を利用した API 実行手順

## サーバサイドアプリケーション向け

### 概要

「Authorization Code Grant + PKCE + ClientSecret」にて認可を行い、API アクセスを行います。
認可フローの詳細については[api実行までのフロー](#補足：api実行までのフロー)を参照してください

### 手順１：認可コード取得

サーバーサイドアプリケーションは認可コード取得のために、ユーザーをAuthorizationエンドポイントへリダイレクトさせます。
ユーザーがALIS画面上でアプリケーションのアクセスを許可した場合、認可コードをパラメーターとして付与したredirect_urlにアクセスします。
サーバーサイドアプリケーションはパラメーターから認可コードを取得します。

### 手順２：アクセストークンの取得

事前に、サーバーサイドアプリケーション開発者はOAuth登録画面にて、「クライアントタイプ：サーバサイドアプリケーション」を指定し登録。Client ID と Client Secret が発行されていることを確認しメモしておきます。
Tokenエンドポイントにリクエストすることで、Access Token, Refresh Token, ID tokenを取得します。

リクエストは以下のように、Client IDと Client Secretを":"(コロン)で連結し、Base64エンコードしたものをAuthorizationヘッダに加えます。

リクエスト例
```
POST /token HTTP/1.1
Host: oauth2.alis.to
Content-Type: application/x-www-form-urlencoded
Authorization: Basic xxxxxxxxxxxxxxxxx
 
grant_type=authorization_code
&code=xxxxxxxxxxxxxxx
&redirect_uri=https%3A%2F%2Fclient.example.org%2Fcb
&code_verifier=7vN7KSmEl5qFeHeRZmfMsR7fl_BsluESjvl32W9el5A6WgsAbXCaqwK43BmXjs7cGw9hTQC9xmVb41xi8fL4CA
```

### 手順３：ID tokenの検証

ID tokenの署名を検証します。
公開鍵はJWKsエンドポイントにて取得可能です。

### 手順４：API 実行サンプル

取得したアクセストークンをAuthorization: Bearer ヘッダを使ってAPIエンドポイントへリクエストを送信します。

```javascript
  const result = await fetch(url, {
    method: "POST",
    headers: {
      "Authorization": `Bearer ${access_token}`,
      "Content-Type": "application/json; charset=utf-8"
    },
    body: JSON.stringify(data)
  });
```

## ネイティブアプリケーション向け

### 概要

ネイティブアプリケーションはClientSecretを秘匿できないので、
「Authorization Code Grant + PKCE」にて認可を行い、API アクセスを行います。
認可フローの詳細については[api実行までのフロー](#補足：api実行までのフロー)を参照してください

### 手順１：認可コード取得

ネィテイブアプリケーションは認可コード取得のために、ユーザーをAuthorizationエンドポイントへアクセスさせます。
ユーザーがALIS画面上でアプリケーションのアクセスを許可した場合、認可コードをパラメーターとして付与したredirect_urlにアクセスします。
ネィテイブアプリケーションはパラメーターから認可コードを取得します。

### 手順２：アクセストークンの取得

事前に、ネイティブアプリケーション開発者はOAuth登録画面にて、「クライアントタイプ：アネイティブアプリケーション」を指定し登録。Client ID が発行されていることを確認しメモしておきます。
Tokenエンドポイントにリクエストすることで、Access Token, Refresh Token, ID tokenを取得します。

リクエスト例
```
POST /token HTTP/1.1
Host: oauth2.alis.to
Content-Type: application/x-www-form-urlencoded
 
grant_type=authorization_code
&code=xxxxxxxxxxxxxxx
&redirect_uri=https%3A%2F%2Fclient.example.org%2Fcb
&code_verifier=7vN7KSmEl5qFeHeRZmfMsR7fl_BsluESjvl32W9el5A6WgsAbXCaqwK43BmXjs7cGw9hTQC9xmVb41xi8fL4CA
```

### 手順３：ID tokenの検証

ID tokenの署名を検証します。
公開鍵はJWKsエンドポイントにて取得可能です。

### 手順４：API 実行サンプル

取得したアクセストークンをAuthorization: Bearer ヘッダを使ってAPIエンドポイントへリクエストを送信します。

```javascript
  const result = await fetch(url, {
    method: "POST",
    headers: {
      "Authorization": `Bearer ${access_token}`,
      "Content-Type": "application/json; charset=utf-8"
    },
    body: JSON.stringify(data)
  });
```

## 補足：API実行までのフロー

* [PKCE](https://www.authlete.com/documents/article/pkce)
* [Authorization Code Grant](https://tools.ietf.org/html/rfc6749#section-4.1)
