# Repo searcher
Search GitHub repos with their API

### Prerequisites

- Ruby 2.7.2
- gem rails (currently version 6.1.4)
- gem bundler

I recommend following [LeWagon's setup](https://github.com/lewagon/setup) to get your environment ready, but you'll probably have to install the required ruby version with rbenv

### Set up

Start in your folder with dev projects

- `gh repo clone Naokimi/repo-searcher`
- `cd repo-searcher`
- `bundle install`
- `yarn install`
- `rails db:create db:migrate db:seed`

### Running

Start in the project folder

- `rails s`

### Special thanks

Rails app generated with [Naokimi/lewagon-rails-templates-plus](https://github.com/Naokimi/lewagon-rails-templates-plus).
