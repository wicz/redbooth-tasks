# encoding: utf-8
require "spec_helper"
require_app "models/task"

describe Task, "#resolved?" do
  let(:task_double) { double(:task, status: "resolved") }

  context "when status is resolved" do
    it do
      task = Task.new(task_double)

      expect(task.resolved?).to eq(true)
    end
  end

  context "when status is resolved" do
    before do
      allow(task_double).to receive_messages(status: "open")
    end

    it do
      task = Task.new(task_double)

      expect(task.resolved?).to eq(false)
    end
  end
end

