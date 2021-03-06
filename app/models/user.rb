# encoding: utf-8

class User
  include ActiveModel::Model

  attr_accessor :name, :email, :id, :token

  def self.build_from_auth_hash(params = {})
    new.tap do |user|
      user.name   = params["info"]["name"]
      user.email  = params["info"]["email"]
      user.id     = params["uid"]
      user.token  = params["credentials"]["token"]
    end
  end

  def as_json(options = {})
    super(only: %w(name email id token)).merge(options)
  end

  validates_with UserValidator
end

