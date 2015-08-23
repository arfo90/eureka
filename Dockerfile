from ruby:2

WORKDIR src

ENTRYPOINT bundle exec rackup
