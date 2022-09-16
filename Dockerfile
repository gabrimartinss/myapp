FROM ruby:3.0.2

RUN apt-get update \ 
    && apt-get install -y --no-install-recommends \
	&& apt-get install libpq-dev -y

WORKDIR /app

COPY Gemfile* ./

RUN bundle install

COPY . .

EXPOSE 3000

RUN rake db:create
RUN rake db:migrate

CMD ["rails", "s", "-b", "0.0.0.0"]