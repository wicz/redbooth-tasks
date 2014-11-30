# encoding: utf-8

module Tasks
  RecordNotFound = Class.new(StandardError)

  class ResolveTask
    def initialize(api_client)
      @client = api_client
    end

    def resolve_task(id)
      client.task(:update, id: id, status: "resolved")
    rescue OAuth2::Error => error
      raise RecordNotFound.new(error)
    end

    private

    attr_reader :client
  end
end

