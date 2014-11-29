# encoding: utf-8

class UserValidator < ActiveModel::Validator
  def initialize(options = {})
    options[:class].class_eval do
      validates :name,
                :email,
                :id,
                :token,
                presence: true
    end
  end

  def validate(object)
  end
end

