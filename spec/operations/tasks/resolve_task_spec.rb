# encoding: utf-8
require "spec_helper"
require "oauth2/error"
require_app "operations/tasks/resolve_task"

describe Tasks::ResolveTask, "#resolve_task" do
  let(:api_client)    { double.as_null_object }
  let(:oauth_error)   { OAuth2::Error.new(double.as_null_object) }
  let(:task_resolver) { described_class.new(api_client) }

  it "delegates to client#task" do
    task_resolver.resolve_task(1)

    expect(api_client).to have_received(:task)
                          .with(:update, id: 1, status: "resolved")
  end

  it "re-raises proper exception" do
    allow(api_client).to receive(:task).and_raise(oauth_error)

    expect { task_resolver.resolve_task(0) }.to raise_error(Tasks::RecordNotFound)
  end
end

