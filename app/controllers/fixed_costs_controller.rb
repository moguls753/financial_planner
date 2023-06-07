class FixedCostsController < ApplicationController
  def new
    @fixed_cost = FixedCost.where(user_id: Current.user.id).first_or_initialize
  end

  def create
    @fixed_cost = Current.user.create_fixed_cost(fixed_cost_params)
    if @fixed_cost.save
      redirect_to root_path, notice: "Fixkosten gespeichert"
    else
      flash.now[:alert] = @fixed_cost.errors.full_messages.first
      render :index, status: :unprocessable_entity
    end
  end

  private

  def fixed_cost_params
    params.require(:fixed_cost).permit(:rent, :electricity)
  end
end
