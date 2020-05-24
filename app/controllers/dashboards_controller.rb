# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :set_dashboard, only: %i[show edit update destroy]

  def index
    @q = Dashboard.ransack(params[:q])
    @dashboards = @q.result(distinct: true)
                    .order('created_at DESC')
                    .paginate(page: params[:page], per_page: 6)
  end

  def show
    @dashboard = Dashboard.find(params[:id])
  end

  def new
    @dashboard = Dashboard.new
  end

  def edit; end

  def create
    @user = current_user
    @dashboard = @user.dashboards.build(dashboard_params)
    @dashboard.date = Date.today
    @dashboard.save
  end

  def update
    @dashboard.update(dashboard_params)
  end

  def destroy
    @dashboard_id = @dashboard.id
    @dashboard.destroy
  end

  private

  def set_dashboard
    @dashboard = Dashboard.find(params[:id])
  end

  def dashboard_params
    params.require(:dashboard).permit(:title, :date, :content, :user_id, :message_priority_id)
  end
end
