FROM ruby

ADD Gemfile* /app/
RUN cd app && gem install bundler && bundle install
ADD . /app
CMD cd /app && ruby find-server.rb

