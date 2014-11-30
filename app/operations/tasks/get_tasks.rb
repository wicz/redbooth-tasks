# encoding: utf-8

module Tasks
  class GetTasks
    def initialize(api_client)
      @client = api_client
    end

    def get_tasks(options = {})
      client.task(:index, options).all.map do |task|
        Task.new(task)
      end
    end

    private

    attr_reader :client
  end
end

