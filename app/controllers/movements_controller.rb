class MovementsController < ApplicationController
  before_action :authenticate_user!

  def new
    @movement = @product.movements.build
  end

  def create
    @movement = @product.movements.build(movement_params)
    if @movement.save
      redirect_to @product, notice: 'Movement was successfully created.'
    else
      render :new
    end
  end

  private

  def movement_params
    params.require(:movement).permit(:quantity, :movement_type, :date)
  end
end
