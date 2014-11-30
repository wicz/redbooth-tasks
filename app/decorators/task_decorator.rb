# encoding: utf-8
require "delegate"

class TaskDecorator < SimpleDelegator
  def css_classes
    css = ["task"]

    css << "resolved" if resolved?

    css.join(" ")
  end
end

