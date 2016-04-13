FROM ruby:2.2
MAINTAINER kevin@idempotent.ca
RUN apt-get -y install imagemagick
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs
ADD . /app
WORKDIR /app
RUN gem install bundler
RUN bundle install
CMD rake db:create db:schema:load db:seed && rails server

VOLUME /app
EXPOSE 3000
