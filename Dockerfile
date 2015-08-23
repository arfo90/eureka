from ruby:2


WORKDIR /temperature-data-depot-iotcc

ADD Gemfile /temperature-data-depot-iotcc/Gemfile
ADD Gemfile.lock /temperature-data-depot-iotcc/Gemfile.lock

RUN bundle install --binstubs

ADD config.ru /temperature-data-depot-iotcc/config.ru
ADD tests /temperature-data-depot-iotcc/tests
ADD lib /temperature-data-depot-iotcc/lib
ADD Rakefile /temperature-data-depot-iotcc/Rakefile

CMD ["bundle", "exec", "rackup"]
