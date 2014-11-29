# encoding: utf-8
require "rails_helper"

describe UserValidator do
  let(:user)    { build_user }
  let(:errors)  { user.errors }

  it "requires name" do
    expect(errors).to include(:name)
  end

  it "requires email" do
    expect(errors).to include(:email)
  end

  it "requires id" do
    expect(errors).to include(:id)
  end

  it "requires token" do
    expect(errors).to include(:token)
  end

  private

  def build_user
    User.new.tap { |user| user.valid? }
  end
end

