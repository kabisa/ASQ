FROM springest/ruby:2.1.5

# Rubygems and bundler
RUN gem update --system --no-ri --no-rdoc
RUN gem install bundler --no-ri --no-rdoc

# python-software-properties is required for add-apt-repository.
RUN useradd asq
RUN mkdir /home/asq
ADD . /home/asq
RUN chown -R asq: /home/asq

WORKDIR /home/asq

RUN su asq -c 'bundle install --deployment'
CMD su asq -c /home/asq/docker_runner.rb

EXPOSE 3000
