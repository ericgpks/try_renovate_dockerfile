# ベースイメージとして Fluentd を使用
FROM fluent/fluentd:v1.18-1

# 必要なツールをインストール
RUN apk add --no-cache build-base

# プラグインをインストール
RUN gem install fluent-plugin-s3 -v 1.7.2 --no-document

# 設定ファイルをコピー
COPY fluent.conf /fluentd/etc/

# ポートを公開
EXPOSE 24224

# コマンドを指定
CMD ["fluentd", "-c", "/fluentd/etc/fluent.conf"]
