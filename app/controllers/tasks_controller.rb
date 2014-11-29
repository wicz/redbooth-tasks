# encoding: utf-8

class TasksController < ApplicationController
  include SessionsHelper

  before_action :authenticate_user!

  def index
    render(:index)
  end
end

