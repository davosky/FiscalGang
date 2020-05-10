# frozen_string_literal: true

class UseTypesController < ApplicationController
  before_action :set_use_type, only: %i[show edit update destroy]

  def index
    @use_types = UseType.all.order('position ASC')
  end

  def edit; end

  def create
    @use_type = UseType.new(use_type_params)
    @use_type.save
  end

  def update
    @use_type.update(use_type_params)
  end

  def destroy
    @use_type_id = @use_type.id
    @use_type.destroy
  end

  private

  def set_use_type
    @use_type = UseType.find(params[:id])
  end

  def use_type_params
    params.require(:use_type).permit(:name, :position)
  end
end
