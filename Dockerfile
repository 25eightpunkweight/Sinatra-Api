FROM ruby:latest
ADD . /app
WORKDIR /app
RUN bundle install
EXPOSE 9292