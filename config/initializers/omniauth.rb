# encoding: utf-8

Rails.application.configure do
  config.redbooth_app_id      = ENV["REDBOOTH_APP_ID"]
  config.redbooth_app_secret  = ENV["REDBOOTH_APP_SECRET"]
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(:redbooth,
           RedboothTasks::Application.config.redbooth_app_id,
           RedboothTasks::Application.config.redbooth_app_secret)
end

