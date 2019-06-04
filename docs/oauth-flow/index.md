# OAuth2.0 を利用した API 実行手順

## サーバサイドアプリケーション向け

### 概要

「Authorization Code Grant + PKCE + ClientSecret」にて認可を行い、API を実行します。
この認可の詳細については[参考： 認可フローについて](#参考：-認可フローについて)を参照ください。

### 手順１：認可コード取得

認可コードを受け取るためには、まずユーザ側に認可コード発行の同意を求める必要があります。
[同意画面へのURL作成方法](/authorization-url/) を元に同意を求める画面への URL を作成し、ユーザに同意を求めます。

ユーザ側で同意が行われると上記 URL 作成時に指定した redirect_uri へリダイレクトされ、query string より認可コード(code)を取得できます。

例) https://example.com/oauth?code=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


### 手順２：アクセストークンの取得

事前に [アプリケーション登録](http://alis.to/me/settings/applications)にて登録したアプリケーション（クライアントタイプ：サーバーサイドアプリケーション）より、Client ID と Client Secret を取得します。
この Client ID と Client Secret を元に https://alis.to/oauth2/token へ下記例を参考にリクエストし、Access Token, Refresh Token, ID tokenを取得します。


リクエスト例
```
POST /oauth2/token HTTP/1.1
Host: alis.to
Content-Type: application/x-www-form-urlencoded
Authorization: Basic xxxxxxxxxxxxxxxxx

grant_type=authorization_code
&code=xxxxxxxxxxxxxxx
&redirect_uri=https%3A%2F%2Fclient.example.org%2Fcb
&code_verifier=7vN7KSmEl5qFeHeRZmfMsR7fl_BsluESjvl32W9el5A6WgsAbXCaqwK43BmXjs7cGw9hTQC9xmVb41xi8fL4CA
```
- Authorization: Client IDと Client Secretを":"(コロン)で連結し、Base64エンコードした値
- code: 手順1で取得した認可コード
- redirect_uri: [同意画面へのURL作成方法](/authorization-url/) で指定した redirect_uri
- code_verifier: [同意画面へのURL作成方法](/authorization-url/) で作成した code_verifier



### 手順３：ID tokenの検証

ID token の署名を検証します。検証方法については [ID token の検証](/idtoken-verify/)を確認ください。

### 手順４：API 実行サンプル

取得したアクセストークン(Access Token)を Authorization ヘッダに付与することで、API 実行を行えます。
実行できる API は同意時に指定した scope によって異なります。詳細は[権限一覧](/scopes/)を確認ください。
また、アクセストークンには有効期限が設定されています。再取得する場合は[アクセストークンの再取得](/refresh-token/)を参照してください


```javascript
  const result = await fetch(url, {
    method: "POST",
    headers: {
      "Authorization": `${access_token}`,
      "Content-Type": "application/json; charset=utf-8"
    },
    body: JSON.stringify(data)
  });
```

## ネイティブアプリケーション向け

### 概要

ネイティブアプリケーションは ClientSecret を秘匿できないので、
「Authorization Code Grant + PKCE」にて認可を行い、API を実行します。
この認可の詳細については[参考： 認可フローについて](#参考：-認可フローについて)を参照ください。

### 手順１：認可コード取得

認可コードを受け取るためには、まずユーザ側に認可コード発行の同意を求める必要があります。
[同意画面へのURL作成方法](/authorization-url/) を元に同意を求める画面への URL を作成し、ユーザに同意を求めます。

ユーザ側で同意が行われると上記 URL 作成時に指定した redirect_uri へリダイレクトされ、query string より認可コード（code）を取得できます。

例) 
  app://example.com/oauth?code=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

### 手順２：アクセストークンの取得

事前に [アプリケーション登録](http://alis.to/me/settings/applications)にて登録したアプリケーション（クライアントタイプ：ネイティブアプリケーション）より、Client ID を取得します。
この Client ID を元に https://alis.to/oauth2/token へ下記例を参考にリクエストし、Access Token, Refresh Token, ID tokenを取得します。


リクエスト例
```
POST /oauth2/token HTTP/1.1
Host: alis.to
Content-Type: application/x-www-form-urlencoded
 
grant_type=authorization_code
&client_id=1234567890
&code=xxxxxxxxxxxxxxx
&redirect_uri=https%3A%2F%2Fclient.example.org%2Fcb
&code_verifier=7vN7KSmEl5qFeHeRZmfMsR7fl_BsluESjvl32W9el5A6WgsAbXCaqwK43BmXjs7cGw9hTQC9xmVb41xi8fL4CA
```
- client_id: 登録したアプリケーションに紐づく Client ID
- code: 手順1で取得した認可コード
- redirect_uri: [同意画面へのURL作成方法](/authorization-url/) で指定した redirect_uri
- code_verifier: [同意画面へのURL作成方法](/authorization-url/) で作成した code_verifier


### 手順３：ID tokenの検証

ID token の署名を検証します。検証方法については [ID token の検証](/idtoken-verify/)を確認ください。

### 手順４：API 実行サンプル

取得したアクセストークン(Access Token)を Authorization ヘッダに付与することで、API 実行を行えます。
実行できる API は同意時に指定した scope によって異なります。詳細は[権限一覧](/scopes/)を確認ください。
また、アクセストークンには有効期限が設定されています。再取得する場合は[アクセストークンの再取得](/refresh-token/)を参照してください。

実行例 (JavaScript)

```javascript
  const result = await fetch(url, {
    method: "POST",
    headers: {
      "Authorization": `${access_token}`,
      "Content-Type": "application/json; charset=utf-8"
    },
    body: JSON.stringify(data)
  });
```

### 参考： 認可フローについて

* [Authorization Code Grant](https://tools.ietf.org/html/rfc6749#section-4.1)
* [PKCE](https://www.authlete.com/documents/article/pkce)

