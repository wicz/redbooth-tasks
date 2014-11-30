# encoding: utf-8
require "rails_helper"
require_app "operations/tasks/get_tasks"

describe TasksController, "#index" do
  let(:user)        { double(id: 1337) }
  let(:task_reader) { double.as_null_object }

  before do
    allow(controller).to receive_messages(current_user: user,
                                          task_reader: task_reader)
  end

  context "when user is signed in" do
    it "load tasks for current user" do
      get(:index)

      expect(task_reader).to have_received(:get_tasks)
                            .with(assigned_user_id: user.id)
    end
  end

  context "when it is a guest access" do
    before do
      allow(controller).to receive_messages(current_user: nil)
    end

    it "redirects to root w/ error message" do
      get(:index)

      expect(response).to redirect_to(root_path)
      expect(flash[:error]).to be
    end

    it do
      pending "TODO: Move authentication checks to another spec"
      fail
    end
  end

  context "when authorization fails" do
    it "redirects to root path" do
      allow(task_reader).to receive(:get_tasks).and_raise(Tasks::NotAuthorizedError)

      get(:index)

      expect(response).to redirect_to(root_path)
    end
  end
end

