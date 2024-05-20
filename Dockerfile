FROM ruby:3.0

RUN apt-get update -qq && apt-get install -y nodejs

WORKDIR /chat_sandbox

COPY Gemfile /chat_sandbox/Gemfile
COPY Gemfile.lock /chat_sandbox/Gemfile.lock

RUN bundle install

COPY . /chat_sandbox

EXPOSE 3000

CMD ["bundle", "exec",  "rails", "server", "-b", "0.0.0.0", "-p", "3000"]

