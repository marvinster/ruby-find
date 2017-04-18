FROM ruby

ADD . /app
RUN cd app && gem install bundler && bundle install
CMD cd /app && ruby find-server.rb

