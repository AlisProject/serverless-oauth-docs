# 権限一覧
ALIS OAuth では権限によって利用できる Web API を制限しております。

## 利用できる権限
### read 権限
読み取り専用の権限。一部例外を除き読み取り系の処理(HTTP メソッドでは GET で表現される)のみに制限される。

### write 権限
読み取り/書き込み用の権限。read に加えて、リソースの作成(POST)、更新(PUT)、削除(DELETE)が可能。

## 権限と利用できる API の対応表

| メソッド | API パス/概要 | read | write | API ドキュメント |
|:---:|---|:---:|:---:|:---:|
| GET | /search/articles <br>記事検索 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_search_articles)
| GET | /search/users <br>ユーザー検索 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_search_users)
| GET | /search/tags <br>タグ検索 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_search_tags)
| GET | /articles/recent <br>最新記事一覧情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_recent)
| GET | /articles/popular <br>人気記事一覧情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_popular)
| GET | /articles/eyecatch <br>アイキャッチ記事一覧情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_eyecatch)
| GET | /articles/recommended <br>オススメ記事一覧情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_recommended)
| GET | /articles/{article_id} <br>記事情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_article_id)
| GET | /articles/{article_id}/alistoken <br>記事のALISトークン数を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_article_id_alistoken)
| GET | /articles/{article_id}/likes <br>記事の「いいね」数を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_article_id_likes)
| GET | /articles/{article_id}/comments <br>記事のコメントの一覧を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_articles_article_id_comments)
| GET | /comments/{comment_id}/likes <br>コメントに付与されているいいね数を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_comments_comment_id_likes)
| GET | /me/articles/drafts <br>下書き記事一覧情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_drafts)
| POST | /me/articles/drafts/article_id <br>article_idを作成 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_articles_drafts_article_id)
| PUT | /me/articles/{article_id}/drafts/ <br>publish_with_header <br>下書き記事を公開 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_drafts_publish_with_header)
| GET | /me/articles/public <br>公開記事一覧情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_public)
| GET | /me/articles/{article_id}/public <br>公開記事情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_article_id_public)
| GET | /me/articles/{article_id}/public/edit <br>編集記事情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_article_id_public_edit)
| PUT | /me/articles/{article_id}/public/unpublish <br>公開記事を下書きに戻す |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_public_unpublish)
| PUT | /me/articles/{article_id}/public/ <br>republish_with_header <br>編集記事を公開 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_public_republish_with_header)
| GET | /me/articles/{article_id}/like <br>「いいね」を行ったかを確認 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_article_id_like)
| POST | /me/articles/{article_id}/comments <br>てコメントを登録 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_articles_article_id_comments)
| POST | /me/articles/{article_id}/comments/reply <br>コメントの返信を登録 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_articles_article_id_comments_reply)
| GET | /me/articles/{article_id}/comments/likes <br>いいねを実行したコメントのID一覧を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_article_id_comments_likes)
| DELETE | /me/comments/{comment_id} <br>コメントを削除 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/delete_me_comments_comment_id)
| POST | /me/comments/{comment_id}/likes <br>コメントに対していいね実施 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_comments_comment_id_likes)
| POST | /me/articles/{article_id}/fraud <br>対象記事に不正報告を行う |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_articles_article_id_fraud)
| GET | /me/articles/{article_id}/image_upload_url <br>画像アップロード用URLを取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_article_id_image_upload_url)
| GET | /me/info <br>ログインユーザ情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_info)
| PUT | /me/info <br>ユーザ情報を更新 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_info)
| POST | /me/info/icon <br>ユーザアイコンを登録 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_info_icon)
| GET | /users/{user_id}/articles/public <br>ユーザーの公開記事一覧情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_users_user_id_articles_public)
| GET | /me/articles/{article_id}/drafts <br>下書き記事を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_articles_article_id_drafts)
| PUT | /me/articles/{article_id}/drafts/title <br>下書き記事のタイトル更新 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_drafts_title)
| PUT | /me/articles/{article_id}/drafts/body <br>下書き記事のbody更新 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_drafts_body)
| PUT | /me/articles/{article_id}/public/title <br>公開記事のタイトル更新 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_public_title)
| PUT | /me/articles/{article_id}/public/body <br>公開記事のbody更新 |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_articles_article_id_public_body)
| GET | /users/{user_id}/info <br>ユーザ情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_users_user_id_info)
| GET | /me/notifications <br>ログインユーザーの通知の一覧を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_notifications)
| GET | /me/unread_notification_managers <br>通知の未読情報を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_me_unread_notification_managers)
| PUT | /me/unread_notification_managers <br>通知の未読情報を既読に更新 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/put_me_unread_notification_managers)
| GET | /topics <br>トピックの一覧を取得 | ○ | ○ | [Document](https://alisproject.github.io/api-docs/#/default/get_topics)
| POST | /me/users/{user_id}/fraud <br>対象ユーザーに不正報告を行う |  | ○ | [Document](https://alisproject.github.io/api-docs/#/default/post_me_users_user_id_fraud)
