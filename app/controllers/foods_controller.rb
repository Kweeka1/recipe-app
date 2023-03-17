class FoodsController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params.merge(user_id: current_user.id))

    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new, alert: 'Cannot create food, retry again.'
    end
  end

  def destroy
    @food = Food.find(params[:id])

    if @food.destroy
      redirect_to foods_path, notice: 'Food was successfully destroyed.'
    else
      redirect_to foods_path, status: :not_found
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
