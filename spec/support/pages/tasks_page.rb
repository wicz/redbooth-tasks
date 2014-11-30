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
      #do |task|
        #yield task
      #end
    end

    def size
      tasks.size
    end

    private

    attr_reader :tasks
  end
end

