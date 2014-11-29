# encoding: utf-8
require "rails_helper"

describe "Access root" do
  it "shows welcome login page" do
    visit "/"

    expect(page).to have_content("Welcome to RedboothTasks")
  end
end

