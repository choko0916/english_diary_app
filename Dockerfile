FROM ruby:3.1.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /english_diary_app
WORKDIR /english_diary_app
COPY Gemfile /english_diary_app/Gemfile
COPY Gemfile.lock /english_diary_app/Gemfile.lock
RUN bundle install
COPY . /english_diary_app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]