# encoding: utf-8
require "rails_helper"

describe "Tasks", "unauthorized access" do
  it "shows error message" do
    visit tasks_path

    expect(page).to have_content("Access denied")
  end
end

