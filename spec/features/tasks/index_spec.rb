# encoding: utf-8
require "rails_helper"
require "webmock/rspec"
require_spec_support "authentication"
require_spec_support "pages/tasks_page"

describe "List tasks" do
  let(:tasks) { RedboothTasks::Pages::Tasks.new(page) }

  before do
    stub_request(:get, /.*redbooth.*/)
      .to_return(body: File.read(Rails.root.join("spec/fixtures/api/tasks.json")))
  end

  it "has two tasks, with one already resolved" do
    visit     root_path
    click_on  "Sign in"

    expect(tasks.count).to           eq(2)
    expect(tasks.resolved.count).to  eq(1)
  end
end

