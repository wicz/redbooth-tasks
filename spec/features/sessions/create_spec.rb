# encoding: utf-8
require "rails_helper"
require "webmock/rspec"
require_spec_support "authentication"

describe "Sign in with Redbooth" do
  before do
    stub_request(:get, /.*redbooth.*/) .to_return(body: "")
  end

  it do
    visit     root_path
    click_on  "Sign in"

    expect(page).to have_content("Sign out")
  end
end

