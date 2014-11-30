# encoding: utf-8
require "rails_helper"

describe SessionsHelper, "#current_user" do
  let(:user_attrs) {{
    name: "John",
    email: "john@doe.com",
    id: 1337,
    token: "foo"
  }}

  it "initialize User from session attributes" do
    allow(session).to receive(:[]).with(:user) { user_attrs }

    user = helper.current_user

    expect(user.name).to eq("John")
  end

  it "returns nil for invalid user" do
    expect(helper.current_user).to be_nil
  end
end

