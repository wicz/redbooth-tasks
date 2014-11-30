# encoding: utf-8

module RedboothTasks::Pages
  class Tasks
    include Capybara::DSL
    include Enumerable

    def initialize(page)
      @tasks = page.all("li.task")
    end

    def each(&block)
      tasks.each(&block)
    end

    def resolved
      select { |task| task[:class].include?("resolved") }
    end

    def count
      tasks.count
    end

    private

    attr_reader :tasks
  end
end

