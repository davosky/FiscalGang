# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action :set_location, only: %i[show edit update destroy]

  def index
    @locations = Location.all.order('position ASC')
  end

  def edit; end

  def create
    @location = Location.new(location_params)
    @location.save
  end

  def update
    @location.update(location_params)
  end

  def destroy
    @location_id = @location.id
    @location.destroy
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :position)
  end
end
