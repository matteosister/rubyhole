FROM ruby:2.2

WORKDIR /code
ADD . /code
RUN bundle install
RUN rake install

VOLUME /code