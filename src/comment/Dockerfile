FROM alpine:latest
ENV APP_HOME /app
ADD Gemfile* $APP_HOME/
ADD . $APP_HOME
WORKDIR $APP_HOME
RUN apk --no-cache add ruby-full ruby-dev build-base  \
    && gem install bundler --no-ri --no-rdoc \
    && gem update --system \
    && bundle install \
    && apk del build-base ruby-dev \
    && bundle clean --force


ENV COMMENT_DATABASE_HOST post_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
