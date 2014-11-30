# encoding: utf-8
require "delegate"

class TaskDecorator < SimpleDelegator
  def css_classes
    "task task-#{status}"
  end

  def created_at
    at = Time.at(__getobj__.created_at)

    I18n.l(at, format: :long)
  end
end

