FROM ruby:3.2.2-alpine
  RUN apk add \
    build-base \
    tzdata \
    nodejs

  WORKDIR /app
  COPY Gemfile* ./
  RUN bundle install
  COPY . .
  EXPOSE 3000
  CMD ["rails", "server", "-b", "0.0.0.0"]
