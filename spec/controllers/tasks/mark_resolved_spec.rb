# encoding: utf-8
require "rails_helper"
require_app "operations/tasks/resolve_task"

describe TasksController, "#mark_resolve" do
  let(:user)          { double(id: 1337) }
  let(:task_resolver) { double.as_null_object }

  before do
    allow(controller).to receive_messages(current_user: user,
                                          task_resolver: task_resolver)
  end

  it "mark task a resolved" do
    get(:mark_resolved, id: "1")

    expect(task_resolver).to have_received(:resolve_task).with("1")
  end

  context "when task not found" do
    it "redirects to tasks path w/ error" do
      allow(task_resolver).to receive(:resolve_task).and_raise(Tasks::RecordNotFound)

      get(:mark_resolved, id: "1")

      expect(response).to redirect_to(tasks_path)
      expect(flash[:error]).to be
    end
  end
end

