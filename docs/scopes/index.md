# スコープ一覧
ALIS OAuthではスコープを設定しており、それぞれのスコープによって利用できるWeb APIを制限しております。

## 利用できるスコープ
### read
読み取り権限用スコープ。一部例外を除き読み取り系の処理(HTTPメソッドではGETで表現される)のみに制限される。

### write
読み取り/書き込み権限用スコープ。readに加えて、リソースの作成(POST)、更新(PUT)、削除(DELETE)が可能。

## スコープと利用できるAPIの対応表

| path | APIの概要 | read | write | API Document |
|:---:|:---:|:---:|:---:|:---:|
| GET /search/articles | 記事検索 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_search_articles)
| GET /search/users | ユーザー検索 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_search_users)
| GET /search/tags | タグ検索 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_search_tags)
| GET /articles/recent | 最新記事一覧情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_recent)
| GET /articles/popular | 人気記事一覧情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_popular)
| GET /articles/eyecatch | アイキャッチ記事一覧情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_eyecatch)
| GET /articles/recommended | オススメ記事一覧情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_recommended)
| GET /articles/{article_id} | 指定されたarticle_idの記事情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_article_id)
| GET /articles/{article_id}/alistoken | 指定された article_id のALISトークン数を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_article_id_alistoken)
| GET /articles/{article_id}/likes | 指定された article_id の記事の「いいね」数を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_article_id_likes)
| GET /articles/{article_id}/comments | 指定された article_id の記事のコメントの一覧を取得する | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_article_id_comments)
| GET /comments/{comment_id}/likes | 指定されたコメントに付与されているいいね数を取得する | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_comments_comment_id_likes)
| GET /me/articles/drafts | 下書き記事一覧情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_drafts)
| POST /me/articles/drafts | 下書き記事を作成 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_articles_drafts)
| POST /me/articles/drafts/article_id | article_idを作成 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_articles_drafts_article_id)
| PUT /me/articles/{article_id}/drafts/publish | 指定された article_id の下書き記事を公開 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_drafts_publish)
| PUT /me/articles/{article_id}/drafts/publish_with_header | 指定された article_id の下書き記事を公開 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_drafts_publish_with_header)
| GET /me/articles/public | 公開記事一覧情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_public)
| GET /me/articles/{article_id}/public | 指定された article_id の公開記事情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_article_id_public)
| PUT /me/articles/{article_id}/public | 指定された article_id の編集記事情報を上書き |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_public)
| GET /me/articles/{article_id}/public/edit | 指定された article_id の編集記事情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_article_id_public_edit)
| PUT /me/articles/{article_id}/public/unpublish | 指定された article_id の公開記事を下書きに戻す |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_public_unpublish)
| PUT /me/articles/{article_id}/public/republish | 指定された article_id の編集記事を公開する |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_public_republish)
| PUT /me/articles/{article_id}/public/republish_with_header | 指定された article_id の編集記事を公開する |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_public_republish_with_header)
| GET /me/articles/{article_id}/like | 指定された article_id の記事に「いいね」を行ったかを確認 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_article_id_like)
| POST /me/articles/{article_id}/comments | 指定された article_id の記事に対してコメントを登録する |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_articles_article_id_comments)
| POST /me/articles/{article_id}/comments/reply | 指定された article_id の記事に対してコメントの返信を登録する |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_articles_article_id_comments_reply)
| GET /me/articles/{article_id}/comments/likes | 指定された記事のコメントの中で、自分がいいねを実行したコメントのIDの一覧を取得する | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_article_id_comments_likes)
| DELETE /me/comments/{comment_id} | 指定されたコメントを削除する |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/delete_me_comments_comment_id)
| POST /me/comments/{comment_id}/likes | 指定されたコメントに対していいねする |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_comments_comment_id_likes)
| POST /me/articles/{article_id}/fraud | 対象記事に不正報告を行う |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_articles_article_id_fraud)
| POST /me/articles/{article_id}/images | 対象記事に画像データを登録 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_articles_article_id_images)
| GET /me/articles/{article_id}/image_upload_url | 対象記事に画像データをアップロードできるURLを取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_article_id_image_upload_url)
| GET /me/info | ログインユーザ情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_info)
| PUT /me/info | ユーザ情報を更新 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_info)
| POST /me/info/icon | ユーザアイコンを登録 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_info_icon)
| GET /users/{user_id}/articles/public | 指定されたユーザーの公開記事一覧情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_users_user_id_articles_public)
| GET /me/articles/{article_id}/drafts | 指定されたIDの下書き記事取得を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_article_id_drafts)
| PUT /me/articles/{article_id}/drafts | 下書き記事を更新 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_drafts)
| PUT /me/articles/{article_id}/drafts/title | 下書き記事のタイトル更新 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_drafts_title)
| PUT /me/articles/{article_id}/drafts/body | 下書き記事のbody更新 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_drafts_body)
| PUT /me/articles/{article_id}/public/title | 公開記事のタイトル更新 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_public_title)
| PUT /me/articles/{article_id}/public/body | 公開記事のbody更新 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_public_body)
| GET /users/{user_id}/info | 指定されたユーザーのユーザ情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_users_user_id_info)
| GET /me/wallet/balance | ログインユーザ情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_wallet_balance)
| GET /me/wallet/distributed_tokens | ログインユーザのトークン付与情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_wallet_distributed_tokens)
| GET /me/notifications | ログインユーザーの通知の一覧を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_notifications)
| GET /me/unread_notification_managers | ログインユーザーの通知の未読情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_unread_notification_managers)
| PUT /me/unread_notification_managers | ログインユーザーの通知の未読情報を未読に更新する | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_unread_notification_managers)
| GET /topics | トピックの一覧を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_topics)
| POST /me/users/{user_id}/fraud | 対象ユーザーに不正報告を行う |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_users_user_id_fraud)
