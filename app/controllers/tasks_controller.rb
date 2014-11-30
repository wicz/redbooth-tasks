# encoding: utf-8

class TasksController < ApplicationController
  include SessionsHelper

  before_action :authenticate_user!

  def index
    @tasks = task_reader.get_tasks(assigned_user_id: current_user.id)

    render(:index, locals: { tasks: decorate(tasks) })
  end

  def mark_resolved
    task_resolver.resolve_task(params[:id])
  rescue Tasks::RecordNotFound
    flash[:error] = "Task not found."
  ensure
    redirect_to(tasks_path)
  end

  private

  attr_reader :tasks

  def task_resolver
    Tasks::ResolveTask.new(api_client)
  end

  def task_reader
    Tasks::GetTasks.new(api_client)
  end

  def api_client
    RedboothRuby::Client.new(RedboothRuby::Session.new(token: current_user.token))
  end
end

