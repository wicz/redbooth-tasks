# encoding: utf-8
require "spec_helper"
require "oauth2/error"
require_app "operations/tasks/get_tasks"

describe Tasks::GetTasks, "#get_tasks" do
  let(:api_client)  { double(:api_client).as_null_object }
  let(:oauth_error) { OAuth2::Error.new(double.as_null_object) }
  let(:task_reader) { described_class.new(api_client) }

  it "delegates to client#task with parameters" do
    task_reader.get_tasks(user_id: 1)

    expect(api_client).to have_received(:task).with(:index, user_id: 1)
  end

  it "re-raises proper exception" do
    allow(api_client).to receive(:task).and_raise(oauth_error)

    expect { task_reader.get_tasks }.to raise_error(Tasks::NotAuthorizedError)
  end
end

