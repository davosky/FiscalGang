# frozen_string_literal: true

class IseeCardsController < ApplicationController
  before_action :set_isee_card, only: %i[show edit update destroy]

  def index
    @q = IseeCard.ransack(params[:q])
    @isee_cards = @q.result(distinct: true)
                    .order('created_at DESC')
                    .paginate(page: params[:page], per_page: 50)
  end

  def show
    @isee_card = IseeCard.find(params[:id])
  end

  def edit; end

  def create
    @last_id = IseeCard.maximum(:id)
    @user = current_user
    @isee_card = @user.isee_cards.build(isee_card_params)
    @isee_card.date = Date.today
    @isee_card.code = @last_id.to_i + 1
    @isee_card.save
  end

  def update
    @user = current_user
    @full_user = @user.name + ' ' + @user.surname
    @isee_card.updater = @full_user
    @isee_card.update(isee_card_params)
  end

  def destroy
    @isee_card_id = @isee_card.id
    @isee_card.destroy
  end

  private

  def set_isee_card
    @isee_card = IseeCard.find(params[:id])
  end

  def isee_card_params
    params.require(:isee_card).permit(:code, :date, :name, :surname, :phone, :email, :use_type_id, :location_id, :user_id, :completion_date, :completed, :updater, :note, :fiscal_code)
  end
end
