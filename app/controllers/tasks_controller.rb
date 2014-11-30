# encoding: utf-8

class TasksController < ApplicationController
  include SessionsHelper

  before_action :authenticate_user!

  def index
    @tasks = task_reader.get_tasks(assigned_user_id: current_user.id)

    render(:index, locals: { tasks: decorate(tasks) })
  end

  private

  attr_reader :tasks

  def task_reader
    api_client = RedboothRuby::Client.new(RedboothRuby::Session.new(token: current_user.token))

    Tasks::GetTasks.new(api_client)
  end
end

