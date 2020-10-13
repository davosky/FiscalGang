class IcricPaisController < ApplicationController
  before_action :set_icric_pai, only: %i[show edit update destroy]

  def index
    @q = IcricPai.ransack(params[:q])
    @icric_pais = @q.result(distinct: true)
                    .order('created_at DESC')
                    .paginate(page: params[:page], per_page: 50)
  end

  def show
    @icric_pai = IcricPai.find(params[:id])
  end

  def edit; end

  def create
    @last_id = IcricPai.maximum(:id)
    @user = current_user
    @icric_pai = @user.icric_pais.build(icric_pai_params)
    @icric_pai.date = Date.today
    @icric_pai.code = @last_id.to_i + 1
    @icric_pai.save
  end

  def update
    @user = current_user
    @full_user = @user.name + ' ' + @user.surname
    @icric_pai.updater = @full_user
    @icric_pai.update(icric_pai_params)
  end

  def destroy
    @icric_pai_id = @icric_pai.id
    @icric_pai.destroy
  end

  private

  def set_icric_pai
    @icric_pai = IcricPai.find(params[:id])
  end

  def icric_pai_params
    params.require(:icric_pai).permit(:code, :date, :name, :surname, :phone, :email, :use_type_id, :location_id, :user_id, :completion_date, :completed, :updater, :note, :fiscal_code)
  end
end
