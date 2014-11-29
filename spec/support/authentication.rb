# encoding: utf-8

module RedboothTasks
  module AuthenticationHelpers
    extend self

    def load_auth_hash_for(provider)
      ::JSON.load(Rails.root.join("spec/fixtures/oauth/#{provider}.json"))
    end
  end
end

RSpec.configure do |config|
  config.include RedboothTasks::AuthenticationHelpers, :include_auth_support
end

OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:redbooth, RedboothTasks::AuthenticationHelpers.load_auth_hash_for(:redbooth))

