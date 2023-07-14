class ApiController < ApplicationController
  before_action :require_user_logged_in!

  def fixed_cost
    render json: Current.user.fixed_cost.as_frontend_json
  end

end
