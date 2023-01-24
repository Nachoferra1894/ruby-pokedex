FROM ruby:3.0.0-alpine

# RUN apk add --update --no-cache \
#     build-base \
#     postgresql-dev \
#     tzdata

# ENV APP_HOME /app
# RUN mkdir $APP_HOME
# WORKDIR $APP_HOME

# COPY Gemfile* $APP_HOME/
# RUN bundle install --jobs 20 --retry 5

# COPY . $APP_HOME

# EXPOSE 3000
# CMD ["rails", "server", "-b", "0.0.0.0"]

RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    tzdata
RUN apk add --no-cache bash
RUN apk add git

WORKDIR /my_api
COPY Gemfile /my_api/Gemfile
COPY Gemfile.lock /my_api/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "127.0.0.1"]
