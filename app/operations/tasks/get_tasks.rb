# encoding: utf-8

module Tasks
  NotAuthorizedError = Class.new(StandardError)

  class GetTasks
    def initialize(api_client)
      @client = api_client
    end

    def get_tasks(options = {})
      client.task(:index, options).all.map do |task|
        Task.new(task)
      end
    rescue OAuth2::Error => error
      raise NotAuthorizedError.new(error)
    end

    private

    attr_reader :client
  end
end

