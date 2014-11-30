# encoding: utf-8
require "spec_helper"
require_app "operations/tasks/get_tasks"

describe Tasks::GetTasks, "#get_tasks" do
  let(:api_client) { double(:api_client).as_null_object }

  it "delegates to client#task with parameters" do
    task_reader = described_class.new(api_client)

    task_reader.get_tasks(user_id: 1)

    expect(api_client).to have_received(:task).with(:index, user_id: 1)
  end
end

