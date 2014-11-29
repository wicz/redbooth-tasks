# encoding: utf-8
require "rails_helper"

describe "Tasks", "list all" do
  it do
    visit tasks_path

    expect(page).to have_content("My Tasks")
  end
end

