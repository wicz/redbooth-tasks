# encoding: utf-8
require "rails_helper"
require "webmock/rspec"
require_spec_support "authentication"
require_spec_support "pages/tasks_page"

describe "Mark task as resolved" do
  let(:tasks) { RedboothTasks::Pages::Tasks.new(page) }

  before do
    stub_request(:get, /.*redbooth.*/)
      .to_return(body: File.read(Rails.root.join("spec/fixtures/api/tasks.json")))
      .to_return(body: File.read(Rails.root.join("spec/fixtures/api/resolved_tasks.json")))

    stub_request(:put, /.*redbooth.*/)
  end

  it do
    visit root_path
    click_on "Sign in"

    tasks.last.mark_resolved
    tasks.reload!

    expect(tasks.resolved.count).to eq(2)
  end
end

