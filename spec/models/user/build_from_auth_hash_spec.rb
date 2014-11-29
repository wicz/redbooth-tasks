# encoding: utf-8
require "spec_helper"
require_spec_support "authentication"
require_app "models/user"

describe User, ".build_from_auth_hash", :include_auth_support do
  it do
    user = User.build_from_auth_hash(load_auth_hash_for(:redbooth))

    expect(user).to have_attributes(name: "Andrés Bravo",
                                    email: "andres.bravo@redbooth.com",
                                    id: 656485,
                                    token: "b0e722c2c7a94f20de4blol439579ac06b26ed89a")
  end
end

