# encoding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def decorate(object)
    if object.respond_to?(:map)
      object.map { |item| decorate(item) }
    else
      "#{object.class}Decorator".constantize.new(object)
    end
  end
end

