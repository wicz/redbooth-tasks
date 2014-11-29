# encoding: utf-8
require "rails_helper"

describe TasksController, "#index" do
  context "when user is signed in" do
    it "renders index" do
      allow(controller).to receive_messages(user_signed_in?: true)

      get(:index)

      expect(response).to render_template(:index)
    end
  end

  context "when it is a guest access" do
    it "redirects to root w/ error message" do
      get(:index)

      expect(response).to redirect_to(root_path)
      expect(flash[:error]).to be
    end
  end
end

