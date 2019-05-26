# 同意画面のURL作成

## 概要

認可コード取得にはユーザーの許可が必要です。
同意画面へ遷移する際は https://alis.to/oauth-authenticate という URL に以下のクエリパラメータを加えてください。

* client_id
* redirect_uri
* scope
* code_challenge

## 各パラメータ説明

### client_id

OAuth アプリケーションを登録した際に発行されたclient_idを指定して下さい

### redirect_uri

OAuth アプリケーションを登録した際に指定したredirect_uriの内一つを指定して下さい。

### scope

OAuth アプリケーションのscopeを指定します。
`read` もしくは `write` を指定できます。`read`、`write`によって使用できるAPIの権限が異なります。詳細は[権限一覧](/scopes/)を確認ください。

### code_challenge

[PKCE](https://tools.ietf.org/html/rfc7636#appendix-B)で使用するパラメータです。
ALIS API を使用するアプリケーション側で code_verifier を生成し、code_challenge を計算して下さい。

例) 

    code_verifier = "dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk"
    code_challenge = "E9Melhoa2OwvFrEMTJguCHaoeK1t8URWbuGJSstw-cM"

code_verifier, code_challenge生成例

```javascript
"use strict";
const base64url = require("base64url");
const sha256 = require("js-sha256");
(async () => {
  const code_verifier = get_code_verifier();
  const code_challenge = get_code_challenge(code_verifier);
  console.log(
    `code_verifier = ${code_verifier}\ncode_challenge = ${code_challenge}`
  );
})();
function get_code_challenge(str) {
  const hash = sha256.arrayBuffer(str);
  return base64url(hash);
}
function get_code_verifier() {
  let buf = Buffer.alloc(32);
  for (let i = 0; i < buf.length; i++) {
    const random_num = Math.floor(Math.random() * 256);
    buf.writeUInt8(random_num, i);
  }
  return base64url(buf);
}
```

## URL例


* client_id = `12345678901234`
* redirect_uri = `https://example.com`
* scope = `read`
* code_challenge = `hcCb3gToI1GPZeS_SIYWvaNT_5u0GB1oqOGQJqRKMSE`

上記パラメーターの場合,URL は下記の通りです。

    
    https://alis.to/oauth?client_id=12345678901234&redirect_uri=https%3A%2F%2Fexample.com&scope=read&code_challenge=hcCb3gToI1GPZeS_SIYWvaNT_5u0GB1oqOGQJqRKMSE

