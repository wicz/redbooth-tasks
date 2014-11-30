# encoding: utf-8
require "delegate"

class Task < SimpleDelegator
  def resolved?
    status == "resolved"
  end
end

