class ApiController < ApplicationController
  before_action :require_user_logged_in!

  def fixed_cost
    render json: Current.user.fixed_cost.as_frontend_json
  end

  def income
    render json: Current.user.employment_contracts.map(&:as_frontend_json).reduce({},:merge)
  end

end
