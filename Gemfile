source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#Added Gems
gem 'haml'
gem 'bootstrap', '~> 4.0.0'
gem 'jquery-rails'
gem 'friendly_id', '~> 5.1.0' # Create slugs for to be used in urls instead of ID's
gem 'devise' # rails g devise:views -> Generates Devise views for customization
gem 'pry'
gem 'trabue_view_tool', git: 'https://github.com/OGNeekoPolo/trabue-view-tool'
gem 'petergate', '~> 1.8' #Used to give users roles for authorization
gem 'redcarpet' # Gem for markdown syntax
gem 'font-awesome-rails' # Gem for icons
gem 'kaminari' # Gem for pagination
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1' # Allows you to add libraries such as .sortable() (jQuery)
gem 'carrierwave', '~> 1.2', '>= 1.2.2' # Used for file uploading
gem 'mini_magick', '~> 4.8' # Used for image uploading
gem 'carrierwave-aws', '~> 1.3' # Allows carrierwave to work with the AWS SDK
gem 'dotenv-rails', '~> 2.2', '>= 2.2.1' # Allows you to setup an environment file for all of your credentials
gem 'cocoon', '~> 1.2', '>= 1.2.11' # Gem for nested forms using jQuery
gem 'gritter', '~> 1.2' # Gem for adding nice notifications to your website
gem 'twitter', '~> 6.2'
gem 'redis', '~> 4.0', '>= 4.0.1' # NoSQL Database