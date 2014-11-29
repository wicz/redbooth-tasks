# encoding: utf-8
require "rails_helper"
require_spec_support "authentication"

describe "Sign in with Redbooth" do
  it do
    visit root_path
    click_on "Sign in"

    expect(page).to have_content("My Tasks")
  end
end

