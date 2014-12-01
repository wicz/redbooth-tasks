# encoding: utf-8

module Tasks
  NotAuthorizedError = Class.new(StandardError)

  class APIClient
    def initialize(session_store)
      @session_store  = session_store
      @session        = RedboothRuby::Session.new(token: session_store[:credentials]["token"])
      @client         = RedboothRuby::Client.new(session)
    end

    def method_missing(method_name, *args, &block)
      first_try = true

      begin
        client.send(method_name, *args, &block)
      rescue OAuth2::Error => error
        if error.code["message"] == "Unauthorized"
          raise NotAuthorizedError.new(error) unless first_try

          first_try = false
          refresh_access_token

          retry
        else
          raise error
        end
      end
    end

    private

    attr_accessor :client
    attr_reader   :session, :session_store

    def refresh_access_token
      session.access_token.refresh_token = session_store[:credentials]["refresh_token"]
      session.access_token = session.access_token.refresh!
      client = RedboothRuby::Client.new(session)

      session_store[:credentials]["token"]          = session.access_token.token
      session_store[:credentials]["refresh_token"]  = session.access_token.refresh_token
    end
  end
end

