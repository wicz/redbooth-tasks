# encoding: utf-8

module RedboothTasks::Pages
  class Task
    include Capybara::DSL

    def initialize(element)
      @element = element
    end

    def resolved?
      element[:class].include?("resolved")
    end

    def mark_resolved
      within(element) { click_on("Mark resolved") }
    end

    private

    attr_reader :element
  end

  class Tasks
    include Capybara::DSL
    include Enumerable
    # FIXME: Enumerable is probably NOT what we want. Delegation FTW!

    def initialize(page)
      reload!
    end

    def reload!
      @tasks = load_tasks
    end

    def each(&block)
      tasks.each(&block)
    end

    def resolved
      select { |task| task.resolved? }
    end

    def count
      tasks.count
    end

    def last
      tasks.last
    end

    private

    attr_reader :tasks

    def load_tasks
      page.all("li.task").map do |el|
        Task.new(el)
      end
    end
  end
end

