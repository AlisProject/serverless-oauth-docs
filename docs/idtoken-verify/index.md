
# ID tokenの検証

## ID token

アクセストークン取得の際にID tokenが同時に渡されます
id_tokenはjwtの形式になっているので、https://oauth2.alis.to/jwks で取得できる公開鍵で署名を検証してください

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

検証するポイントは以下の通りです。

* jwtが https://oauth2.alis.to/jwks で取得できる公開鍵で検証できること
* 有効期限(exp)が現在の時刻を過ぎていない事
* 署名者(iss)が https://oauth2.alis.to であること

## 検証コード例


```javascript
"use strict";
const jwt = require("jsonwebtoken");
const jwkToPem = require("jwk-to-pem");
const fetch = require("node-fetch");

const jwk_url = "https://oauth2.alis.to/jwks";
const token = "xxxxx.yyyyy.zzzzzz....";
const iss = "https://oauth2.alis.to";

(async () => {
  try {
    const sig_key = await get_sig_key(
      jwt.decode(token, { complete: true }).header.kid
    );
    const decoded = jwt.verify(token, sig_key);
    const now_unixtime = Math.floor(new Date().getTime() / 1000);
    if (now_unixtime > decoded.exp) {
      throw new Error("this idtoken is expired.");
    }
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
