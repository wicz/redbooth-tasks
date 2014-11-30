# encoding: utf-8
require "spec_helper"
require_app "decorators/task_decorator"

describe TaskDecorator, "#css_classes" do
  let(:task) { double(:task, resolved?: false) }

  it "includes task" do
    css = TaskDecorator.new(task).css_classes

    expect(css).to include("task")
  end

  context "when task is resolved" do
    it "includes resolved" do
      allow(task).to receive_messages(resolved?: true)

      css = TaskDecorator.new(task).css_classes

      expect(css).to include("resolved")
    end
  end
end

