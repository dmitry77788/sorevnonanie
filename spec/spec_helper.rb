if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_group 'Controllers', 'app/controllers'
    add_group 'Helpers', 'app/helpers'
    add_group 'Mailers', 'app/mailers'
    add_group 'Models', 'app/models'
    add_group 'Views', 'app/views'
    add_group 'Services', 'app/services'
  end
end

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
# @TODO uncomment after resolve selenium-chromedriver-capybara issue
# require 'capybara/rails'
# require 'capybara/rspec'
# require 'capybara-screenshot/rspec'
# require 'selenium-webdriver'
require 'public_activity/testing'
require 'sidekiq/testing'

Rails.application.eager_load! if ENV['COVERAGE']

PublicActivity.enabled = false
# @TODO uncomment after resolve selenium-chromedriver-capybara issue
# Capybara.ignore_hidden_elements = false
# Capybara.javascript_driver = :chrome
# Capybara.register_driver :chrome do |app|
#   options = Selenium::WebDriver::Chrome::Options.new(
#     args: %w[headless disable-gpu no-sandbox]
#   )
#   Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
# end
# Capybara.configure do |config|
#   config.default_max_wait_time = 10 # seconds
#   config.default_driver        = :selenium
# end
#
# Capybara.save_path = '/tmp/capybara-screenshot'
# Capybara::Screenshot.register_filename_prefix_formatter(:rspec) do |example|
#   "screen_#{example.full_description.gsub(' ', '-').gsub(/^.*\/spec\//, '')}"
# end

Dir[Rails.root.join('spec/configs/**/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  config.include ActiveSupport::Testing::TimeHelpers
  config.fail_fast = false
  config.include FactoryBot::Syntax::Methods
  # @TODO uncomment after resolve selenium-chromedriver-capybara issue
  # config.include Capybara::DSL
  config.use_transactional_fixtures                 = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order                                      = 'random'
  config.include AbstractController::Translation
  config.include Devise::TestHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
  config.include LetMacros, type: :controller
  config.before :suite do
    DatabaseRewinder.clean_all
  end
  config.after :each do
    # @TODO uncomment after resolve selenium-chromedriver-capybara issue
    # Capybara.reset_sessions!
    DatabaseRewinder.clean
  end
  config.after(:all) do
    FileUtils.rm_rf(Dir["#{Rails.root}/public/uploads/[^.]*"])
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
