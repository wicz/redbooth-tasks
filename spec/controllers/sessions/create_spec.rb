# encoding: utf-8
require "rails_helper"
require_spec_support "authentication"

describe SessionsController, "#create", :include_auth_support do
  let(:provider)          { :redbooth }
  let(:auth_hash_params)  { load_auth_hash_for(provider) }
  let(:user)              { double(User, valid?: true) }
  let(:user_class)        { class_double(User).as_stubbed_const }

  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[provider]

    allow(user_class).to receive_messages(build_from_auth_hash: user)
  end

  it "builds user from auth hash" do
    get(:create, provider: provider)

    expect(user_class).to have_received(:build_from_auth_hash)
                          .with(auth_hash_params)
  end

  context "when user is valid" do
    it "redirects to tasks path" do
      get(:create, provider: provider)

      expect(response).to redirect_to(tasks_path)
    end

    it "sets current user in session" do
      get(:create, provider: provider)

      expect(session[:user]).to be
    end
  end

  context "when user not valid" do
    it "redirects to root path w/ error message" do
     allow(user).to receive_messages(valid?: false)

     get(:create, provider: provider)

     expect(response).to redirect_to(root_path)
     expect(flash[:error]).to be
    end
  end
end

