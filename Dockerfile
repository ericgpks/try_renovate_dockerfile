# ベースイメージとして Fluentd を使用
FROM fluent/fluentd:v1.14-1

# 必要なツールをインストール
RUN apk add --no-cache build-base

# Gemfile をコピーしてプラグインをインストール
COPY Gemfile Gemfile.lock /fluentd/
RUN gem install bundler && bundle install --gemfile=/fluentd/Gemfile

# 設定ファイルをコピー
COPY fluent.conf /fluentd/etc/

# ポートを公開
EXPOSE 24224

# コマンドを指定
CMD ["fluentd", "-c", "/fluentd/etc/fluent.conf"]
