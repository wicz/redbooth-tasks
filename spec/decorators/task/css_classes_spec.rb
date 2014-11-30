# encoding: utf-8
require "spec_helper"
require_app "decorators/task_decorator"

describe TaskDecorator, "#css_classes" do
  let(:task) { double(status: "resolved") }

  it "includes task and task-status" do
    css = TaskDecorator.new(task).css_classes

    expect(css).to include("task")
    expect(css).to include("task-resolved")
  end
end

