
# ID tokenの検証

## ID token

ID Token とはユーザーの認証情報を含む署名付きのトークンで、jwt フォーマットでエンコードされています。
ALIS のユーザ情報を元にアプリケーションでユーザ認証を行う場合は必ず ID token を使用してセッション等のユーザ認証管理を行ってください。

署名検証に用いる公開鍵は、[jwksエンドポイント](https://alis.to/oauth2/jwks)にて公開されています。


アクセストークン取得時のレスポンス例
```json
{
  "access_token": "xxxxxxxxxxxxxxxxxxxxxxxxxx",
  "refresh_token": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  "scope": "openid read",
  "id_token": "xxxxxxxxxxxxxxxxxxxxxxx.yyyyyyyyyyyyyyyyyyyyyyyyyyyy.zzzzzzzzzzzzzzzzz",
  "token_type": "Bearer",
  "expires_in": 86400
}
```

# 検証手順

1. id_token をピリオドで分割し Header, Payload, Signature を取得します。
2. ヘッダ部分を base64URL デコードし, 鍵の種類(kid)と署名アルゴリズム(alg)を特定します
3. [jwksエンドポイント](https://alis.to/oauth2/jwks)から公開鍵を取得します
4. 2 で取得した kid と同じ公開鍵を特定します
5. 2 で取得した署名アルゴリズム(alg)に基づいて署名を検証します 署名範囲は Header + "." + Payload 部分です
6. Payload 内の exp が現在時刻(UNIXタイム)が現在時刻より大きいことを確認します
7. iss の値が`https://alis.to/oauth2`であることを確認します

## 検証コード例


```javascript
"use strict";
const jwt = require("jsonwebtoken");
const jwkToPem = require("jwk-to-pem");
const fetch = require("node-fetch");

const jwk_url = "https://alis.to/oauth2/jwks";
const token = "xxxxx.yyyyy.zzzzzz....";
const iss = "https://alis.to/oauth2";

(async () => {
  try {
    const sig_key = await get_sig_key(
      jwt.decode(token, { complete: true }).header.kid
    );
    const decoded = jwt.verify(token, sig_key);
    if (decoded.iss !== iss) {
      throw new Error(`this idtoken's iss is not ${iss}`);
    }
    console.log(decoded);
  } catch (e) {
    console.log(e);
  }
})();

async function get_sig_key(kid) {
  const response = await fetch(jwk_url);
  const response_json = await response.json();
  for (const k of response_json.keys) {
    if (k.kid === kid) {
      return jwkToPem(k);
    }
  }
}
```
