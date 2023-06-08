class FixedCostsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @fixed_cost = Current.user.fixed_cost
  end

  def update
    @fixed_cost = Current.user.fixed_cost

    if @fixed_cost.update(fixed_cost_params)
      redirect_to root_path, notice: "Fixkosten gespeichert"
    else
      flash.now[:alert] = @fixed_cost.errors.full_messages.first
      render :index, status: :unprocessable_entity
    end
  end

  private

  def fixed_cost_params
    params.require(:fixed_cost).permit(:rent, :electricity, :internet, :food, :mobile, :savings_plan, :misc)
  end
end
