# encoding: utf-8
require "rails_helper"

describe TasksController, "#index" do
  context "when user is signed in" do
    let(:user)        { double(:user, id: 1337) }
    let(:task_reader) { double(:task_reader).as_null_object }

    before do
      allow(controller).to receive_messages(current_user: user,
                                            task_reader: task_reader)
    end

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
end

