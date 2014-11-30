# encoding: utf-8
require "rails_helper"

describe SessionsHelper, "#current_user" do
  it "initialize User from session attributes" do
    allow(session).to receive(:[]).with(:user) { { name: "John" } }

    user = helper.current_user

    expect(user.name).to eq("John")
  end
end

