from ubuntu:latest

RUN apt-get update
RUN apt-get upgrade -y

# Installing ruby 2.0
RUN apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev wget
RUN apt-get install libyaml-0-2 libyaml-0-2 libssl1.0.0 zlib1g ca-certificates

# JSON Gem is complaining:
RUN apt-get -y install libruby2.0
RUN ln -s /usr/lib/x86_64-linux-gnu/libruby-2.0.so.2.0 /usr/lib/x86_64-linux-gnu/libruby.so.2.0

WORKDIR /tmp
RUN wget http://cache.ruby-lang.org/pub/ruby/ruby-2.0-stable.tar.bz2
RUN tar -xf ruby-2.0-stable.tar.bz2
RUN bash -c "\
cd ruby-2.0.0-p598/ \
&& ./configure --prefix=/usr/local --disable-install-doc \
&& make \
&& make install \
&& cd - \
&& rm -rf /tmp/*"

# installing bundler from Gem repositories
RUN gem install --no-rdoc --no-ri bundler

# Cleaning up build materials
RUN apt-get remove -y build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev wget
RUN apt-get autoremove -y
