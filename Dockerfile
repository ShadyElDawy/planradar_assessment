FROM ruby:2.5.7

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y nodejs postgresql-client && \
    gem install bundler:1.17.3
# Install gems
COPY Gemfile ./
RUN bundle install

# Copy application code
COPY . .

# Expose port
EXPOSE 3000

# Start Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
