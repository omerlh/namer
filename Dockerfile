FROM ruby:2.1
MAINTAINER Education Team at Docker <education@docker.com>

WORKDIR /src
COPY Gemfile /src
RUN bundler install
COPY . .

CMD ["ruby", "company_name_generator.rb"]
EXPOSE 8752
