require "codeclimate-test-reporter"
require "omniauth"
CodeClimate::TestReporter.start

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new  :provider => "twitter",
                                                              :uid      => "UUID",
                                                              :info     => {
                                                                              :name => "John Q Public",
                                                                              :image => "http://www.com",
                                                                              :urls => {
                                                                                          :Twitter => "https://twitter.com/johnqpublic"
                                                                                        }
                                                                            }
